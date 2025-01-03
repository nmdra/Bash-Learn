---
subject: "[[08200 - Bash]]"
---
> [shell - What is the use case of noop [:] in bash](https://stackoverflow.com/questions/12404661/what-is-the-use-case-of-noop-in-bash)
> [shell script - What purpose does the colon builtin ':' serve?](https://unix.stackexchange.com/questions/31673/what-purpose-does-the-colon-builtin-serve)

It's there more for historical reasons. The colon builtin `:` is exactly equivalent to `true`. It's traditional to use `true` when the return value is important, for example in an infinite loop:

```bash
while true; do
  echo 'Going on forever'
done
```

It's traditional to use `:` when the shell syntax requires a command but you have nothing to do.

```bash
while keep_waiting; do
  : # busy-wait
done
```
---
I use it for if statements when I comment out all the code. For example you have a test:

```bash
if [ "$foo" != "1" ]
then
    echo Success
fi
```

but you want to temporarily comment out everything contained within:

```bash
if [ "$foo" != "1" ]
then
    #echo Success
fi
```

Which causes bash to give a syntax error:

```bash
line 4: syntax error near unexpected token `fi'
line 4: `fi'
```

Bash can't have empty blocks (WTF). So you add a no-op:

```bash
if [ "$foo" != "1" ]
then
    #echo Success
    :
fi
```

or you can use the no-op to comment out the lines:

```bash
if [ "$foo" != "1" ]
then
    : echo Success
fi
```

> [!tip]
> If you use `set -e`, then `|| :` is a great way to _not_ exit the script if a failure happens (it explicitly makes it pass).