---
subject: "[[08200 - Bash]]"
---
xargs command is designed to construct argument lists and invoke other utility.
## Examples

```bash
echo 1 2 3 4 | xargs echo # 1 2 3 4
echo 1 2 3 4 | xargs -n 2
# 1 2
# 3 4
```

## { } as the argument list marker

{} is the default argument list marker. You need to use {} this with various command which take more than two arguments at a time. For example mv command need to know the file name. The following will find all .bak files in or below the current directory and move them to ~/.old.files directory:  
```bash
$ find . -name "*.bak" -print0 | xargs -0 -I {} mv {} ~/old.files
```

You can rename {} to something else. In the following example {} is renamed as file. This is more readable as compare to previous example:  

```bash
$ find . -name "*.bak" -print0 | xargs -0 -I file mv file ~/old.files`
```

- `xargs -I {}` :
	- Replaces `{}` with the item read from input.
	- Used here for operations like `wc`, `head`, and `cp`.
