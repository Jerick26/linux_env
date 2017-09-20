## content
* [gen and debug core file](#gen-and-debug-core-file)
* [attach pid](#attach-pid)

## gen and debug core file
```
ulimit -c unlimited<br>
gdb executable_bin core.24888
bt
gdb -p 43482(pid)
```

## attatch pid
```
gdb
attach 25741 (pid)
```
