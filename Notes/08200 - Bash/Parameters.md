---
subject: "[[08200 - Bash]]"
---
# Parameters

> [!IMPORTANT] 
> Resources:
> - [How To Use Bash Parameter Substitution Like A Pro - nixCraft](https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html)
> - [Basic Parameter Expansion in Bash - You Suck at Programming #026 - YouTube](https://www.youtube.com/watch?v=Bzi7pa7y15M)

`$` character is used for parameter expansion, arithmetic expansion and command substitution. You can use it for manipulating and expanding variables on demands without using external commands such as perl, python, sed or awk.

```bash
name="John"
echo "$name"

printf "%s\n" "$name"
```
# Parameter expansion

## Setting up default shell vaiables value

```bash
_mkdir() {
  local dir="$1"
  local permission=${2:-0755}
  [ $# -eq 0 ] && {
    echo "$0: dirname"
    return
  }
  [ ! -d "$dir" ] && mkdir --mode "$permission" -p "$dir"
}

_mkdir "test" 0644
_mkdir "test-2" 8929 # invalid value
_mkdir "test-3"      # default value
```
## Assign Value

```bash
unset var
unset myUSER
echo "\$var = $var and \$myUSER = $myUSER"
var=${myUSER:=vivek}
echo "\$var = $var and \$myUSER = $myUSER"
```

```bash
# Demonstrating "${var:=defaultValue}" (assignment)
# This will FAIL because positional parameters cannot be assigned in this way.
echo "Using \${1:=defaultValue}:"
var="${1:=defaultValue}"  # This will fail with an error.
echo "Value of var: $var"

# Demonstrating "${var:-defaultValue}" (substitution without assignment)
# This works perfectly.
echo "Using \${1:-defaultValue}:"
var="${1:-defaultValue}"  # This will use 'defaultValue' if $1 is empty or unset.
echo "Value of var: $var"

```