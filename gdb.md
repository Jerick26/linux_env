2017.3.1
gdb executable_bin core.24888
bt
gdb -p 43482(pid)

# gdb attatch pid (2017.3.1)
gdb
attach 25741 (pid)

# find a idle ports
$ netstat -anp | grep 12261 (port number)
