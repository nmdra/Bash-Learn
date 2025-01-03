---
subject: "[[08200 - Bash]]"
---
> [Tutorial 10 - Sed and Awk Utilities \| ULI101 - Introduction to UNIX/Linux and the Internet](https://seneca-ictoer.github.io/ULI101/A-Tutorials/tutorial10)

**sed** is a powerful Unix-based stream editor used for filtering and transforming text. Unlike text editors, **sed** processes text in a non-interactive manner, making it suitable for automated editing tasks. It is widely used in shell scripting, log file manipulation, and data preprocessing.

## Key Features:

1. **Stream Processing**: Edits text line by line without requiring user interaction.
2. **Pattern Matching**: Supports regular expressions for searching and manipulating text.
3. **In-Place Editing**: Can modify files directly using the `-i` option.
4. **Versatility**: Performs tasks like substitution, deletion, insertion, and appending.

---

### Basic Syntax:

```bash
sed [options] 'script' [file]
```

- **`script`**: The command(s) to process the text.
- **`file`**: The input file (optional; can read from standard input).

---

### Common Commands:

1. **Substitute (`s`)**: Replace text patterns.
    
    ```bash
    sed 's/old/new/' file
    ```
    
    - Replaces the first occurrence of `old` with `new` on each line.
2. **Global Replace (`g`)**: Replace all occurrences in a line.
    
    ```bash
    sed 's/old/new/g' file
    ```
    
3. **Delete Lines (`d`)**:
    
    ```bash
    sed '/pattern/d' file
    ```
    
    - Deletes lines matching `pattern`.
4. **Print Lines (`p`)**: Print specific lines.
    
    ```bash
    sed -n '3p' file
    ```
    
    - Prints the 3rd line.
5. **Insert Lines (`i`)**: Add a line before a match.
    
    ```bash
    sed '/pattern/i\New line' file
    ```
    
6. **Append Lines (`a`)**: Add a line after a match.
    
    ```bash
    sed '/pattern/a\New line' file
    ```
    

---

### Examples:

1. **Replace a word**:
    
    ```bash
    sed 's/unix/Linux/' file.txt
    ```
    
2. **Delete empty lines**:
    
    ```bash
    sed '/^$/d' file.txt
    ```
    
3. **Modify file in place**:
    
    ```bash
    sed -i 's/foo/bar/g' file.txt
    ```
    
4. **Print specific range**:
    
    ```bash
    sed -n '5,10p' file.txt
    ```
    
    - Prints lines 5 to 10.
5. **Replace with a delimiter**:
    
    ```bash
    sed 's|/usr/bin|/opt/bin|g' file.txt
    ```
    
    - Use `|` as a delimiter when `/` is part of the text.
