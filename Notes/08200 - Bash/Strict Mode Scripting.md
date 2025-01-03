---
subject: "[[08200 - Bash]]"
---
## Introduction to Robustness in Scripting

- Robustness is the ability of a script to handle unpredictable situations effectively.
- Without proper mechanisms, errors in scripts may go unnoticed, resulting in incorrect behavior.
## Importance of Strict Mode Flags

- **`set -e`:** Causes the script to exit immediately if any command exits with a non-zero status.
- **`set -u`:** Exits the script when an unset variable is used.
- **`set -o pipefail`:** Ensures that the exit code of a pipeline is the exit code of the last command that failed.
### Common Flags for Bash Scripts

#### 1. Debugging and Verbose Output:

- **`set -x`:**
	- Enables a debugging mode that prints each command and its arguments to `stderr` as they are executed.
	- **Use case:** Helpful for debugging to trace the script's execution flow.

```bash
set -x
echo "Debugging this script"
set +x
```

- **`set -v`:**
    
    - Prints shell input lines as they are read, before execution.
    - **Use case:** Provides insight into the script's input parsing.
#### 2. Enhanced Safety:

- **`set -n`:**
    
    - Parses the script without executing it.
    - **Use case:** Used for syntax checking.

```bash
set -n
# Script code here
set +n
```

- **`set -o noclobber`:**
    - Prevents overwriting existing files with redirection (`>`).
    - **Use case:** Ensures accidental overwriting of files is avoided.
- **`set -o errexit`:**
    - An alias for `set -e`. Exits the script on command errors.

---
#### 3. Error Trapping:

- **`set -o errtrace`:**
    - Ensures error traps defined using `trap` are inherited by functions and subshells.
    - **Use case:** Extends error handling to nested and external calls.

```bash
trap 'echo "Error on line $LINENO"' ERR
set -o errtrace
```

- **`set -o functrace`:**
    - Enables debugging traps (`DEBUG`, `RETURN`, and `ERR`) inside functions.
    - **Use case:** For detailed debugging of script functions.

---
#### **4. History Expansion Control:**

- **`set -o histexpand`:**
    - Enables history expansion using `!`.
    - **Use case:** Recall or reuse commands from the command history within scripts.
- **`set +o histexpand`:**
    - Disables history expansion.
    - **Use case:** Prevents unintended command execution caused by `!` in scripts.

---
#### 5. Loop and Subshell Behavior:

- **`set -o noglob`:**
    - Disables filename expansion (globbing) for wildcard characters (`*`, `?`).
    - **Use case:** When dealing with strings containing wildcards.

```bash
set -o noglob
files="*.txt"
echo $files
```

- **`set -o posix`:**
    - Enables stricter POSIX-compliant behavior.
    - **Use case:** To ensure portability between different shell environments.

---
#### 6. Miscellaneous

- **`set -o ignoreeof`:**
    - Prevents accidental script termination by disabling `Ctrl+D` to exit the shell.
    - **Use case:** Prevents accidental logouts in interactive scripts.
- **`set -o verbose`:**
    - Alias for `set -v`. Displays input commands.
- **`set -o monitor`:**
    - Enables job control for background processes.
    - **Use case:** Useful for managing jobs in long-running scripts.

---
### Combining Multiple Flags

You can combine these flags for maximum effect:

```bash
#!/usr/bin/env bash
set -euo pipefail  # Exit on error, unset variables, and pipe failure
set -xv            # Debug and verbose mode
set -o errtrace    # Inherit error traps
trap 'echo "Error occurred at line $LINENO"' ERR
```

## Conditional Execution Operators

- **`||`:** Executes the second command if the first one fails.
- **`&&`:** Executes the second command if the first one succeeds.

 ## Examples of Error Handling in Scripts

- **Without strict mode:**
    - Errors may not stop execution, leading to misleading outcomes (e.g., an undefined command or variable still allows the script to continue).
- **With strict mode:**
    - Errors like command not found or unset variables are immediately reported, and the script halts.

## Reserved Exit Codes

- Common exit codes include:
    - `0` – Success
    - `1` – General error
    - `127` – Command not found
    - `128` – Invalid exit argument
    - `130` – Terminated by Control-C

## Handling Piped Commands with `pipefail`

- Without `pipefail`:
    - If a command in the pipeline fails, the pipeline may still exit with `0`, causing false success reporting.
- With `pipefail`:
    - The pipeline fails as soon as any command in it fails.

