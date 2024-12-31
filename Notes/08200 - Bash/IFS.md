---
subject: "[[08200 - Bash]]"
---
The special shell variable IFS determines how Bash recognizes word boundaries while splitting a sequence of character strings.

**The default value of _IFS_ is a three-character string comprising a space, tab, and newline.**
![[IFS-20250101004429174.webp]]

```bash
for i in `echo -e "foo\tbar\tfoobar"`; do echo "'$i' is the substring"; done
```

## Custom IFS Value

```bash
#!/usr/bin/env bash

elements="element1:elements2:element3"

for element in ${elements}; do
echo "${element} is now separated from the
elements list"
done
```

# Default IFS vs. Custom IFS

- When set to the default:
    - **Leading and trailing whitespace** is stripped from the input string.
    - **Consecutive whitespace** is treated as a single delimiter.

```bash
string="foo  bar    foobar     "
for i in $string; do
  echo "[$i] extracted"
done

# [foo] extracted
# [bar] extracted
# [foobar] extracted
```

- When a custom value (e.g., `:`) is assigned to `IFS`, Bash:
	- Does **not strip leading or trailing characters**.
	- Treats consecutive delimiters as **separate tokens**.

```bash
string="foo:bar::foobar::"
IFS=":"
for i in $string; do
  echo "[$i] extracted"
done

# [foo] extracted
# [bar] extracted
# [] extracted
# [foobar] extracted
# [] extracted
```