---
subject: "[[08200 - Bash]]"
---
# Pipes (`|`)

[What is a simple explanation for how pipes work in Bash? - Stack Overflow](https://stackoverflow.com/questions/9834086/what-is-a-simple-explanation-for-how-pipes-work-in-bash)

Pipes are a powerful feature in Unix-like systems that allow the output of one command to be used as the input for another. They enable chaining multiple commands together in a sequence to achieve complex tasks efficiently.
#### **Syntax**

```bash
command1 | command2 | command3
```

- The standard output (stdout) of `command1` is passed as the standard input (stdin) to `command2`.
- This process continues through the chain of commands.

#### **Examples**

1. **Basic Example**:

```bash
echo "Hello World" | wc -w
```

- `echo "Hello World"` outputs the string "Hello World."
- `wc -w` counts the words in the input and outputs `2`.

2. **Chaining Commands**:

```bash
ls -l | grep ".txt" | sort
```

- `ls -l`: Lists files in long format.
- `grep ".txt"`: Filters files with `.txt` in their names.
- `sort`: Sorts the filtered list alphabetically.
## Pipeline in bash

 _PIPESTATUS_, which contains a list of exit status from the processes in the most recently executed pipeline:

```bash
exit 1 | exit 2 | exit 3 | exit 4 | exit 5
echo ${PIPESTATUS[@]}
# 1 2 3 4 5
```

The return status of the execution of the whole pipeline will depend on the ==_pipefail_== variable’s status.

If this variable is set, the return status of the pipeline will be the exit status of the rightmost command with a non-zero status or will be zero if all commands exit successfully.

```bash
set -o pipefail
exit 1 | exit 2 | exit 3| exit 4 | exit 0
echo $?
# 4
```

Disable pipefail:

```bash
set +o pipefail
exit 1 | exit 2 | exit 3| exit 4 | exit 0
echo $?
0
```

# FIFO aka Named pipes

[Anonymous and Named Pipes in Linux](https://www.baeldung.com/linux/anonymous-named-pipes#named-pipes)

