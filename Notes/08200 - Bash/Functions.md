---
subject: "[[08200 - Bash]]"
---
# Bash Functions

> [!important]
> https://linuxize.com/post/bash-functions/

Compared to most programming languages, Bash functions are somewhat limited.

```Bash
function_name () {
  commands
}
```
OR
```Bash
function_name () { commands; }
```
## Variables Scope

**Global variables** are variables that can be accessed from anywhere in the script regardless of the scope.

**Local variables** can be declared within the function body with the local keyword and can be used only inside that function. 
You can have local variables with the same name in different functions.

## Return Values

Bash functions don’t allow you to return a value when called. When a bash function completes, its **return value is the status of the last statement executed in the function**.

`0` for success and non-zero decimal number in the `1 - 255` range for failure.


