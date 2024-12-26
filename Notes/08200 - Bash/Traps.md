---
subject: "[[08200 - Bash]]"
---
# Bash Traps


> [!important]
> Resources:
> - [Using trap to Run a Command after Your Shell Script Exits - YouTube](https://youtu.be/hWTOfzv_yFE?si=sLz5odjP9-DPPsnJ)   
> - [Shell Scripting - Bash Trap Command - GeeksforGeeks](https://www.geeksforgeeks.org/shell-scripting-bash-trap-command/)

- Trap allows to catch signals and execute code when they occur.
- signals are asynchronous notification that are to your script when certain event occur.

> [!TIP]
> The man page for [signal(7)](http://man7.org/linux/man-pages/man7/signal.7.html) describes all the available signals.

## Commonly Used Signals:

| Signal       | Description                                                           |
| ------------ | --------------------------------------------------------------------- |
| SIGINT (2)   | Interrupt signal, typically sent when pressing Ctrl+C.                |
| SIGTERM (15) | Termination signal, often used for stopping processes gracefully.     |
| SIGKILL (9)  | Kill signal that forcefully terminates a process (cannot be trapped). |
| SIGTSTP (20) | Stop signal, sent by pressing Ctrl+Z.                                 |
| EXIT (0)     | A pseudo-signal received when the script exits.                       |
