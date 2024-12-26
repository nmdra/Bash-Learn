---
subject: "[[08200 - Bash]]"
---
# Bash String Manipulation

> [!IMPORTANT]
> Resources:
> - [Manipulating Strings](https://tldp.org/LDP/abs/html/string-manipulation.html)

### From the Beginning of the String

1. **`${var#pattern}`**  
   Removes the **shortest match** of the pattern from the beginning of the string.
   - Example:
```bash
filename="/home/tux/downloads/test.txt"
echo "${filename#*/}"  # Output: home/tux/downloads/test.txt
```

2. **`${var##pattern}`**  
   Removes the **longest match** of the pattern from the beginning of the string.
   - Example:
```bash
echo "${filename##*/}"  # Output: test.txt
```

### From the End of the String

3. **`${var%pattern}`**  
   Removes the **shortest match** of the pattern from the end of the string.
   - Example:
```bash
echo "${filename%/*}"  # Output: /home/tux/downloads
```

4. **`${var%%pattern}`**  
   Removes the **longest match** of the pattern from the end of the string.
   - Example:
```bash
longpath="/home/tux/downloads/test.txt.bak"
echo "${longpath%%.*}"  # Output: /home/tux/downloads/test
```

---
### Wildcards for Patterns

1. **`*`**  
   Matches **any string** (zero or more characters).
   - Example:
```bash
echo "${filename#*t}"  # Output: ux/downloads/test.txt
```

2. **`?`**  
   Matches **any single character**.
   - Example:
```bash
echo "${filename#?????}"  # Output: tux/downloads/test.txt
```

3. **`[...]`**  
   Matches **any one of the enclosed characters**.
   - Example:
```bash
echo "${filename#*[eo]}"  # Output: me/tux/downloads/test.txt
```

4. **`[^...]`**  
   Matches **any character not enclosed**.
   - Example:
```bash
echo "${filename#*[^a-z]}"  # Output: ux/downloads/test.txt
```

5. **`@`** (Extended globbing, requires `shopt -s extglob`)  
   Matches **one of the specified patterns**.
   - Example:
```bash
shopt -s extglob
echo "${filename#@(home|tux)}"  # Output: /downloads/test.txt
```

6. **`+`** (Extended globbing, requires `shopt -s extglob`)  
   Matches **one or more of the preceding patterns**.
   - Example:
```bash
echo "${filename#@(ho)+}"  # Output: me/tux/downloads/test.txt
```

---
### Default Value Handling

1. **`${var:-default}`**  
   Expands to `default` if `var` is unset or null.  
   - Example:
```bash
unset filename
echo "${filename:-default.txt}"  # Output: default.txt
```

2. **`${var:=default}`**  
   Sets `var` to `default` if it is unset or null, then expands it.
   - Example:
```bash
unset filename
echo "${filename:=default.txt}"  # Output: default.txt
echo "$filename"  # Output: default.txt
```

3. **`${var:?message}`**  
   Exits the script with `message` if `var` is unset or null.
   - Example:
```bash
unset filename
echo "${filename:?Error: filename is not set.}"  # filename: Error: filename is not set.
```

4. **`${var:+alternate}`**  
   Expands to `alternate` if `var` is set and not null.
   - Example:
```bash
filename="test.txt"
echo "${filename:+alternate.txt}"  # Output: alternate.txt
```

---
### Substring Extraction

1. **`${var:offset}`**  
   Extracts a substring starting at the given offset.
   - Example:
```bash
filename="test.txt"
echo "${filename:5}"  # Output: .txt
```

2. **`${var:offset:length}`**  
   Extracts a substring of the specified length starting at the offset.
   - Example:
```bash
echo "${filename:0:4}"  # Output: test
```

---
### Length of Variable

1. **`${#var}`**  
   Expands to the length of `var` in characters.
   - Example:
```bash
filename="test.txt"
echo "${#filename}"  # Output: 8
```

---
### Examples of Combining Patterns

1. **Extract File Extension**
```bash
filename="test.txt"
echo "${filename##*.}"  # Output: txt
```

2. **Remove File Extension**
```bash
echo "${filename%.*}"  # Output: test
```

3. **Get Directory Path**
```bash
filepath="/home/tux/test.txt"
echo "${filepath%/*}"  # Output: /home/tux
```

4. **Get File Name Without Path**
```bash
echo "${filepath##*/}"  # Output: test.txt
```
