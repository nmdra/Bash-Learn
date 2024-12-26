---
subject: "[[08200 - Bash]]"
---
# Shell options

> [!IMPORTANT]
> Resources: https://tldp.org/LDP/abs/html/options.html

Options are settings that change shell and/or script behavior.

The set command enables options within a script.

```bash
#!/bin/bash

set -o verbose # Echoes all commands before executing.
# set -v # alternative method
```

> [!TIP]
> An alternate method of enabling options in a script is to specify them immediately following the #! Script header.
> ```bash
> #!/bin/bash -x
> 
> # Body of script follows.
> ```

## On & Off options

```bash
#!/bin/bash

set -o verbose
# Command echoing on.
command
...
command

set +o verbose
# Command echoing off.
command
# Not echoed.

set -v
# Command echoing on.
command
...
command

set +v
# Command echoing off.
command

exit 0
```
---

# Interactive shell

An interactive shell is defined as the shell that simply takes commands as input on tty from the user and acknowledges the output to the user.

**For example, a bash shell is an interactive shell.**

# Non-Interactive shell

A non-interactive shell is a type of shell that doesn’t interact with the user. We can run it through a script or similar.

## check shell type

```bash
[[ $- == *i* ]] && echo ‘Interactive’ || echo ‘not-interactive’
```
# What `$-` Represents 

The `$-` variable is a string of characters where each character represents a specific shell option that is currently enabled. These options are set when the shell starts or modified using commands like `set`.

## Common Characters

| **Character** | **Meaning**                              |
|---------------|------------------------------------------|
| `i`           | The shell is **interactive**.            |
| `s`           | The shell is **started as a script**.    |
| `h`           | **Hashall**: Tracks command locations.   |
| `a`           | **Allexport**: Exports all variables.    |
| `u`           | **Nounset**: Treats undefined variables as errors. |
| `x`           | **Xtrace**: Prints commands before execution (debugging). |
| `v`           | **Verbose**: Prints shell input lines as they are read. |
| `m`           | **Monitor mode**: Enables job control.   |

### **Examples**

```bash
$ echo $-
himBH
```

- **`i`**: Indicates that the shell is interactive.
- **`h`**: Hashall option is enabled, meaning the shell remembers the location of commands after the first execution.
- Other options (`m`, `B`, `H`) may represent job control and other behaviors.


