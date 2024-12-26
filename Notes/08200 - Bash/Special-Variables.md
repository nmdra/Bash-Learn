---
subject: "[[08200 - Bash]]"
---
# Special Variables

## **Positional Parameters**
| Variable  | Description                                                                                           |
|-----------|-------------------------------------------------------------------------------------------------------|
| `$0`      | The name of the script itself.                                                                        |
| `$1, $2, ...` | The first, second, and subsequent positional parameters (arguments passed to the script).          |
| `$#`      | The total number of arguments passed to the script or function.                                       |
| `"$*"`    | All arguments passed to the script, treated as a single string.                                       |
| `"$@"`    | All arguments passed to the script, treated as separate quoted strings (maintains argument boundaries).|

---

## **Exit Status and Process Information**
| Variable  | Description                                                                                           |
|-----------|-------------------------------------------------------------------------------------------------------|
| `$?`      | The exit status of the last command executed (0 for success, non-zero for failure).                   |
| `$$`      | The process ID (PID) of the current shell or script.                                                  |
| `$!`      | The PID of the last background command.                                                               |

---

### **Special Characters and Delimiters**
| Variable  | Description                                                                                           |
|-----------|-------------------------------------------------------------------------------------------------------|
| `$-`      | The current shell options set, such as `i` for interactive mode.                                      |
| `$_`      | The last argument to the last command executed.                                                       |

---

### **Examples of Special Variables**

#### **1. `$#` (Number of Arguments)**
```bash
#!/bin/bash
echo "Number of arguments passed: $#"
```
Run:
```bash
./script.sh arg1 arg2
```
Output:
```
Number of arguments passed: 2
```

---

#### **2. `$0` (Script Name)**
```bash
#!/bin/bash
echo "This script is called: $0"
```
Run:
```bash
./script.sh
```
Output:
```
This script is called: ./script.sh
```

---

#### **3. `$*` vs `$@`**
**Script**:
```bash
#!/bin/bash
echo "Using \$*: $*"
echo "Using \$@: $@"
```
Run:
```bash
./script.sh "arg1" "arg2 with space"
```
Output:
```
Using $*: arg1 arg2 with space
Using $@: arg1 arg2 with space
```
**Key Difference**:
- `$*` treats all arguments as a single string: `arg1 arg2 with space`.
- `$@` treats them as separate quoted strings: `"arg1" "arg2 with space"`.

---

#### **4. `$?` (Exit Status)**
```bash
#!/bin/bash
ls /nonexistent_directory
echo "Exit status: $?"
```
Run:
```bash
./script.sh
```
Output:
```
ls: cannot access '/nonexistent_directory': No such file or directory
Exit status: 2
```
- `$?` reflects the error code of the last command (`ls` failed with status `2`).

---

#### **5. `$$` (Process ID of the Script)**
```bash
#!/bin/bash
echo "Script PID: $$"
```
Run:
```bash
./script.sh
```
Output:
```
Script PID: 12345
```

---

#### **6. `$!` (PID of Last Background Command)**
```bash
#!/bin/bash
sleep 10 &
echo "Background PID: $!"
```
Run:
```bash
./script.sh
```
Output:
```
Background PID: 12346
```
