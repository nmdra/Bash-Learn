---
subject: "[[08200 - Bash]]"
---

> [!IMPORTANT]
> Resources:
> - [Differences Between the return and exit Commands \| Baeldung on Linux](https://www.baeldung.com/linux/return-vs-exit)

In general, the aim of _return_ is to exit from a [Bash function](https://www.baeldung.com/linux/bash-functions), while the objective of _exit_ is to exit from a [Bash script](https://www.baeldung.com/linux/linux-scripting-series).
# Return

```bash
#!/bin/bash

foo()
{
  if [ ! –z “$1” ]
  then
    return $1
  fi

  ls /non_existing_file >& /dev/null
  return 
}

foo 5
echo “The return value of \”foo 5\” : $?”
 
foo
echo “The return value of \”foo\”   : $?”

```

# Exit

```bash
#!/bin/bash

foo()
{
  if [ ! –z “$1” ]
  then
    exit $1
  fi

  ls /non_existing_file >& /dev/null
  exit
}

if [ ! –z “$1” ]
then
  foo $1
else
  foo
fi

echo “This line will not be printed”
```


