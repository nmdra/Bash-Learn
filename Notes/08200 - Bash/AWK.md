---
subject: "[[08200 - Bash]]"
---
# Introduction to **AWK Programming**

**AWK** is a powerful text-processing tool and programming language primarily used for pattern scanning and data manipulation in Unix-like systems. Named after its creators **Alfred Aho, Peter Weinberger, and Brian Kernighan**, AWK operates on lines of text, making it ideal for processing structured text like CSV files, logs, or data tables.
## Key Features:

1. **Pattern Matching**: AWK can process lines of text based on patterns or regular expressions.
2. **Field and Record Handling**: By default, AWK splits input into records (lines) and fields (columns), using whitespace as a separator.
3. **Built-in Variables**:
   - `$0`: Entire current line.
   - `$1, $2, ...`: Fields in the current line.
   - `NR`: Record (line) number.
   - `NF`: Number of fields in the current line.
4. **Flexibility**: Can be used interactively, via scripts, or directly in the shell.
## How AWK Works:

1. **Input**: Reads text input line by line.
2. **Pattern Matching**: Checks each line against a given pattern.
3. **Action**: Executes commands or processes the data for matched patterns.

## Basic Syntax:

```bash
awk 'pattern { action }' file
```

- **`pattern`**: Specifies which lines or data to process (can be omitted to process all lines).
- **`action`**: Commands or expressions to execute for matching patterns.

### Examples:

1. **Print all lines**:
   ```bash
   awk '{ print $0 }' file.txt
   ```

2. **Print specific fields**:
   ```bash
   awk '{ print $1, $3 }' file.txt
   ```

3. **Filter lines containing a word**:
   ```bash
   awk '/error/ { print $0 }' log.txt
   ```

4. **Sum values in the second column**:
   ```bash
   awk '{ sum += $2 } END { print sum }' data.txt
   ```

5. **Print line numbers**:
   ```bash
   awk '{ print NR, $0 }' file.txt
   ```
