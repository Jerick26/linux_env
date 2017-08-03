
* [Terminal color and format](#Terminal_color_and_format)

# set the bash display to not show the vim text after exit on 2017.1.22
User1 is using TERM=xterm, in this case when you exit vim it will clear the terminal.
User2 is using TERM=vt100, in this case when you exit vim it will not clear the terminal.

# Terminal color and format
edit ~/.bashrc
PS1='\[\033[1;32;1m\]\u:\W \t$\[\033[1;37;1m\] '

# ack on 2017.1.10
ack
ack image_tag --ignore-file=ext:out --ignore-dir=build64_debug
ack image_tag --ignore-file='match:/tags|cscope.*/' --ignore-dir=build64_release

grep
grep -C 3 "match_pattern" file_name --color=auto

# find files according to time on 2017.1.5
find . -type f -atime +7
find . -type f -amin -10

# convert linux time stamp to date and inverse on 2017.1.4

date +%s
date -d '2017-1-4 17:08' +%s
date -d @1483520880
date -d @1483520880 +"%Y-%m-%d %H:%M:%S"

# cscope, ctags on 2016.12.28
find . -regex ".*\.\(h\|cpp\|cc\)" > cscope.files
cscope -bkq -i cscope.files
ctags -L cscope.files
usage for ctag
:tag {ident}    "jump to ident tag
:tags    "show tag stack
:ts    "show all tags found
:tp    "show previous tag
:tn    "show next tags
shortcut
Ctrl+t    "return the last place
Ctrl+]    "jump to the tag place

# shell for loop on 2017.2.22
for i in 1 2 3; do echo $i; done;
for i in {1..3}; do echo $i; done;
for i in $(seq 1 3 10); do echo $i; done
for ((i=1;i<10;i++)); do echo $i; done;

## install software on ubuntu
sudo apt-get install sudo apt-get install
sudo dpkg -i packagename.deb

## eg. Kill CLOSE_WAIT connections by IP
`$ netstat -anp | grep 192.168.0.100 | grep CLOSE_WAIT | awk '{print $7}' | cut -d \/ -f1 | grep -oE "[[:digit:]]{1,}" | xargs kill`
