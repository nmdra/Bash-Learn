---
subject: "[[1300 - Linux]]"
---
# Exit Status

> [!important] 
> Resources 👇
> [Exit and Exit Status](https://tldp.org/LDP/abs/html/exit-status.html)
> [Bash get exit code of command on a Linux / Unix - nixCraft](https://www.cyberciti.biz/faq/bash-get-exit-code-of-command/)
> [Bash Find out the exit codes of all piped commands - nixCraft](https://www.cyberciti.biz/faq/unix-linux-bash-find-out-the-exit-codes-of-all-piped-commands/)

Each Linux or Unix shell command returns a status when it terminates normally or abnormally.

Exit status is an integer number. 0 exit status means the command was successful without any errors. A non-zero (1-255 values) exit status means command was a failure.

You need to use a particular shell variable called `$?` to get the exit status of the previously executed command. 👉 [[Special-Variables]]

## Exit Codes With Special Meanings

| Exit status | Description                                                                                                                                 |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| 1           | Catchall for general errors                                                                                                                 |
| 2           | Misuse of shell builtins (according to Bash documentation)                                                                                  |
| 126         | Command invoked cannot execute                                                                                                              |
| 127         | Command not found                                                                                                                           |
| 128         | Invalid argument to [exit command](https://bash.cyberciti.biz/guide/Exit_command "Exit command - Linux Bash Shell Scripting Tutorial Wiki") |
| 128+n       | Fatal error signal “n”                                                                                                                      |
| 130         | Bash script terminated by Control-C                                                                                                         |
| 255*        | Exit status out of range                                                                                                                    |
|             |                                                                                                                                             |
## With Pipes

```bash
false | false | true
echo "${PIPESTATUS[@]}"

true | true
echo "The exit status of first command ${PIPESTATUS[0]}, and the second command ${PIPESTATUS[1]}"
```

> [!warning] 
> On ZSH
> ```bash
> true | true
> echo "${pipestatus[1]} ${pipestatus[2]}"
> ```

