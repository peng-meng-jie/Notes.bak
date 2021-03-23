####  Linux Tools Quick Tutorial Note

> Level ：Basic level
>
> Note  :  看完之际才发现这点知识完全不够用 !

[toc]

#### 1）Basic 

##### Help

```shell
# 1. Find Tools, whatis -w <command*>
$ whatis whatis
whatis (1)           - display one-line manual page descriptions
# 1.1 Find Bash Patch
$ which man
/usr/bin/man
# 1.2 Find Bash More Patch
$ whereis ls
ls: /usr/bin/ls /usr/share/man/man1/ls.1.gz

# 2. More Help, Man or Info
# Note：Extend command --help
$ whatis info
info (5)             - readable online documentation
info (1)             - read Info documents
$ whatis man
man (7)              - macros to format man pages
man (1)              - an interface to the system reference manuals
$ man whatis
...

# 3. See Help Docs Types // Man Types
:<<!
The table below shows the section numbers of the manual followed by the types of pages they contain.
1   Executable programs or shell commands
2   System calls (functions provided by the kernel)
3   Library calls (functions within program libraries)
4   Special files (usually found in /dev)
5   File formats and conventions, e.g. /etc/passwd
6   Games
7   Miscellaneous (including macro packages and conventions), e.g. man(7), groff(7)
8   System administration commands (usually only for root)
9   Kernel routines [Non standard]
!
$ whatis man
man (7)              - macros to format man pages
man (1)              - an interface to the system reference manuals
$ whatis 7 man # See 7 Types Docs
...

# 4. Support Regexp 
$ man man
...
man -k [apropos options] regexp ...
...

# Note
:<<!
+ Command
whatis   # simple help
info man # detail help
which    # bash path
whereis  # bash path 2
+ Useful
whatis # 查找程序和帮助（简要信息）
info man # 查找程序和帮助（具体信息）
which # 程序路径
whereis # 构建文件和路径
!
```

##### File And Folder

```shell
# File-Folder-Management.sh

# 1. Create And Remove
# Note：Man command
$ mkdir new-2
$ rm new-2
rm: cannot remove 'new-2': Is a directory
$ rm -rf ./folder-test/
$ rm *.log
$ ls
...
$ find ./ | wc -l
find: ‘./CR_27B49.tmp’: Permission denied
16

# 2. Exchange Folder
# Note ：cd 
$ cd /mnt/d/Temp/
yihong@FAB-112:/mnt/d/Temp$ cd ~
$ pwd
/home/yihong
$ whatis pat
patch            path_resolution  pathchk
$ whatis pat
patch            path_resolution  pathchk
$ whatis patch
patch (1)            - apply a diff file to an original
$ man patch

# 3. Show Folder And File
# Note：cli ：ls alias cat
$ ls -lrt
total 54132
-rw-rw-rw- 1 yihong yihong       65 Jun 18  2020 md.md
...
$ vim md.md
$ ls -lrt
total 54132
-rw-rw-rw- 1 yihong yihong       71 Mar  2 10:35 md.md
...

# 4. Find Files
# cli ：find xargs locate 
$ find ./FileTest/ -name '*' | xargs file
./FileTest/:        directory
./FileTest/new:     directory
./FileTest/text.md: ASCII text
$ find ./FileTest/ -name '*.md'
./FileTest/text.md
$ find ./FileTest/ -name '*.md' -exec rm {} \;
$ ls ./FileTest/
new

# 5.1 View And Edit Context
# cli ：cat vi Vim head tail more
$ ls
FileTest  data  md.md
$ cat -n md.md
     1 Linux System Test
     ...
$ head -1 md.md
    inux System Test
$ tail -3 md.md
    3. md
$ diff --help
    Usage: diff [OPTION]... FILES
    Compare FILES line by line.

# 5.2 Find File Context 
$ egrep  'm' md.md
    Linux System Test
    3. md

# 6. Permission modification
# Note: 前提需要了解 Linux 的权限继承。
$ man -r 'ch*'
chmod (1)   - change file mode bits # Resource Permission
chown (1)   - change file owner and group # Resource Owner
...

# 7. Alias
# ln cc ccAgain :硬连接；删除一个，将仍能找到；
# ln -s cc ccTo :符号链接(软链接)；删除源，另一个无法使用；（后面一个ccTo 为新建的文件）

# 8. Parameter pipeline
<<!
+ 批处理命令连接执行，使用 |	#(command-1 | command-2)
+ 串联: 使用分号 ;	#(command-1 ; command-2)
+ 前面成功，则执行后面一条，否则，不执行:&&	#(command-1 %% command-2)
+ 前面失败，则后一条执行: ||	#(command-1 || command-2)
!
# 9. System Path
# PATH=$APPDIR:/opt/app/soft/bin:$PATH:/usr/local/bin:$TUXDIR/bin:$ORACLE_HOME/bin;export PATH

# 10. Keyboard Shortcut
<<! 
> Ctl-U   删除光标到行首的所有字符,在某些设置下,删除全行
> Ctl-W   删除当前光标到前边的最近一个空格之间的字符
> Ctl-H   backspace,删除光标前边的字符
> Ctl-R   匹配最相近的一个文件，然后输出
!
# Note
$ cat notify_20210301.log  | grep 'yihong.*' | grep -V '09' | wc -l
8
$ cat notify_20210301.log  | grep 'yihong.*' | wc -l
12
:<<!
Files Management
cli:mkdir mv rm 
Files Find
cli:Find locate gerp egrep
View Files Context
cli: vim cat head tail 
Files Parameter Pipeline
cli: : ; | && >
!
```

##### Text Content

```shell
# Process-Text-Content.sh
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

# Base-cli：find、grep、xargs、sort、uniq、tr、cut、paste、wc、sed、awk
# 1.Find Files（cli：man find）

$ find . \( -^Cme "*.bat" -o -name "*.py" \) -print # 搜索指定文件
./Auto-Logoff-PPC.bat
./Check_FAB_Network.py
...
$ find . -regex ".*\(\.py\)" # 搜索文件，正则表达式
./bak.scripts/#close#GetTodayWeather.py
./bak.scripts/AutoCheckComputerService.py
./bak.scripts/save_as_img.py
...
$ find . ! -name "*.LOG" # 排除文件类型
$ find . -maxdepth 2 -type f # 文件深度
<<!
@ find 文件过滤“功能”（过滤文件）
支持文件类型，find <option> -type f-file l-符号 d-folder
扩展，二进制搜索（cli：file | awk）配合使用
支持时间过滤，find <option> -atime -mtime - ctime
支持大小过滤，find <option> -size <tag>
支持权限过滤，find <option> -perm <tag>
支持用户过滤，find <option> -user 
更多“特性”或帮助，cli:$ man find（或者 Web-Online ）
!
<<!
@ find 扩展功能（过滤后执行操作）
执行删除，find <option> -delete
执行删除 2，find <cli> | xargs rm
附加命令，find <cli> -exec 
> find . -type f -user root -exec chown weber {} \; # 变更权限
> find . -type f -mtime +10 -name "*.txt" -exec cp {} OLD \; # 复制权限
> -exec ./commands.sh {} \; # 附加命令
!

# 2.Context-Search（cli：man grep）
<<!
@ useful-parameter
grep --help (node)
    -o, --only-matching       show only nonempty parts of lines that match # 匹配行
    -c, --count               print only a count of selected lines per FILE # 统计
    -n, --line-number         print line number with output lines # 显示行
        --line-buffered       flush output on every line 
    -I                        equivalent to --binary-files=without-match # 大小写
    -L, --files-without-match  print only names of FILEs with no selected lines # 输出文件名
!
$ grep -e "import" . -R -n
<<!
@ Use
grep -e "class" -e "vitural" <file> # 附加条件（过滤）
cat LOG.* | tr a-z A-Z | grep "FROM " | grep "WHERE" > b # 过滤文本内容（查找SQL代码）
!

# 3.Exchange-parameter（cli：man xargs）
<<! 
$ xargs --help
    Usage: xargs [OPTION]... COMMAND [INITIAL-ARGS]...
    Run COMMAND with arguments INITIAL-ARGS and more arguments read from input.
@ copy
# 统计程序行数
$ find source_dir/ -type f -name "*.cpp" -print0 |xargs -0 wc -l
# redis通过string存储数据，通过set存储索引，需要通过索引来查询出所有的值：
./redis-cli smembers $1  | awk '{print $1}'|xargs -I {} ./redis-cli get {}
$ find /tmp -name core -type f -print | xargs /bin/rm -f
Find files named core in or below the directory /tmp and delete them.  Note that this will work incorrectly if
there are any filenames containing newlines or spaces.
$ find /tmp -name core -type f -print0 | xargs -0 /bin/rm -f
Find files named core in or below the directory /tmp and delete them, processing filenames in such a way  that
file or directory names containing spaces or newlines are correctly handled.
Note:cli man xargs
!

# 4.More-Text-Tools
# includ cli：sort uniq tr cut paste wc sed
# 依据功能的面向方面进行分类（针对于文本的“功能操作”）
# cli-shell-system（api-io[drive-cpu-disk]），从表面的界面对文本进行操作（背后有计算机的底层暗箱操作）
<<!
@ sort # 内容排序
$ sort --help
  Usage: sort [OPTION]... [FILE]...
     or:  sort [OPTION]... --files0-from=F
  Write sorted concatenation of all FILE(s) to standard output.
  With no FILE, or when FILE is -, read standard input.
  -k, --key=KEYDEF          sort via a key; KEYDEF gives location and type
  -n, --numeric-sort          compare according to string numerical value
  ...
Example
ort -nrk 1 data.txt
sort -bd data // 忽略像空格之类的前导空白字符
!
<<!
@ uniq # 消除（或统计）重复内容
$ uniq --help
    Usage: uniq [OPTION]... [INPUT [OUTPUT]]
    Filter adjacent matching lines from INPUT (or standard input),
    writing to OUTPUT (or standard output).
    With no options, matching lines are merged to the first occurrence.
    -c, --count           prefix lines by the number of occurrences
    -d, --repeated        only print duplicate lines, one for each group
$ sort 2021-3-9.LOG | uniq -d
!
<<!
@ tr # 内容转换
$ tr --help
    Usage: tr [OPTION]... SET1 [SET2]
    Translate, squeeze, and/or delete characters from standard input,
    writing to standard output.
Example，Node
@ 通用用法
echo 12345 | tr '0-9' '9876543210' //加解密转换，替换对应字符
cat text| tr '\t' ' '  //制表符转空格
@ 删除字符
cat file | tr -d '0-9' // 删除所有数字
...
!
<<!
@ cut # 切割”文体“
$ cut --help
    Usage: cut OPTION... [FILE]...
    Print selected parts of lines from each FILE to standard output.
    With no FILE, or when FILE is -, read standard input.
    -f, --fields=LIST       select only these fields;  also print any line
$ cut -f2,4 filename # 提取一部分
$ cut -f3 --complement filename # 去除一部分
$ cut -c1-5 file //打印第一到5个字符
$ cut -c-2 file  //打印前2个字符
$ echo string | cut -c5-7 # 截取文本的第5到第7列
!
<<!
@ paste # “移花接木”
$ paste --help
    Usage: paste [OPTION]... [FILE]...
    Write lines consisting of the sequentially corresponding lines from
    each FILE, separated by TABs, to standard output.
    With no FILE, or when FILE is -, read standard input.
    Mandatory arguments to long options are mandatory for short options too.
    -d, --delimiters=LIST   reuse characters from LIST instead of TABs
Example，Test-1
$ cat file1
1
2
$ cat file2
colin
book
$ paste file1 file2 # 拼接
1 colin
2 book
!
<<!
@ wc 统计
$ wc --help
    Usage: wc [OPTION]... [FILE]...
       or:  wc [OPTION]... --files0-from=F
    Print newline, word, and byte counts for each FILE, and a total line if
    more than one FILE is specified.  A word is a non-zero-length sequence of
    characters delimited by white space.
$ wc -l file // 统计行数
$ wc -w file // 统计单词数
$ wc -c file // 统计字符数
!
<<!
@ sed 替换
$ sed --help
  Usage: sed [OPTION]... {script-only-if-no-other-script} [input-file]...
$ cat mk.mk
    # mk
    123
    ## mk 2
    456
$ sed 's/#/E/' mk.mk # 首行替换
    E mk
    123
    E# mk 2
    456
Example
$ sed '/^$/d' file # 去除空白
$ sed -i 's/text/repalce_text/g' file # 另存一份被替换的副本
$ sed 's/text/replace_text/g' file #全局替换
!
# 5. Awk
<<! # 基础
AWK是一种优良的文本处理工具，Linux及Unix环境中现有的功能最强大的数据处理引擎之一。

AWK是一种处理文本文件的语言。它将文件作为记录序列处理。
在一般情况下，文件内容的每行都是一个记录。
每行内容都会被分割成一系列的域，因此，我们可以认为一行的第一个词为第一个域，第二个词为第二个，以此类推。
AWK程序是由一些处理特定模式的语句块构成的。AWK一次可以读取一个输入行。
对每个输入行，AWK解释器会判断它是否符合程序中出现的各个模式，并执行符合的模式所对应的动作。
    ——阿尔佛雷德·艾侯，The A-Z of Programming Languages: AWK!

awk ' BEGIN{ statements } statements2 END{ statements } ' # 基本结构
工作方式，
1.执行begin中语句块；
2.从文件或stdin中读入一行，然后执行statements2，重复这个过程，直到文件全部被读取完毕；
3.执行end语句块；
!
$ echo -e "line1\nline2" | awk 'BEGIN{print "start"} {print } END{ print "End" }'
    start # 开始时执行 begin 代码块
    line1 # 继承管道前面的内容 （ \n 被隐藏）
    line2 # 同上（无 \n）
    End   # 结束时执行 end 代码块
$ echo | awk ' {var1 = "v1" ; var2 = "V2"; var3="v3"; print var1, var1,var2 , var3; }'
v1 v1 V2 v3
$ echo | awk ' {var1 = "v1" ; var2 = "V2"; var3="v3"; print var1, var1","var2 "," var3; }'
v1 v1,V2,v3
# Link：https://www.tutorialspoint.com/awk/awk_basic_examples.htm

# Note 
<<!
## Index
## 文件名处理
文件夹和文件名处理 find 
> 类型 时间 大小 附加操作... + sh 批处理不在话下 ！

## 内容处理
内容搜索 grep
内容转化 xargs
内容排序 sort
重复内容处理 uniq
内容转换 tr
内容拼接 paste
内容统计 wc
内容替换 sed

## 程序化处理文本内容 
@AWK 优秀处理文本文件工具（在众多工具中脱颖而出）
基于文本行进行处理，“批处理”，如下：
行列匹配、shell、正则表达式、循环、变量 ...
$ awk
    Usage: awk [POSIX or GNU style options] -f progfile [--] file ...
    Usage: awk [POSIX or GNU style options] [--] 'program' file ...
    ...
    Examples:
     gawk '{ sum += $1 }; END { print sum }' file
     gawk -F: '{ print $1 }' /etc/passwd
Extend
https://www.tutorialspoint.com/awk/awk_basic_examples.htm
https://www.runoob.com/linux/linux-comm-awk.html
!


```

##### Disk

```shell
# 4.About-Disk(of-view-archive)
read -p "Continue? (Y/N): " | exit 1

# 1.View Disk
# cli: df du
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
rootfs          223G  174G   49G  79% /
$ du -sh
187M    .
# 2.tar
# tar (1)              - an archiving utility
!<<!
$ tar --help
Usage: tar [OPTION...] [FILE]...
GNU 'tar' saves many files together into a single tape or disk archive, and can
restore individual files from the archive.
Examples:
  tar -cf archive.tar foo bar  # Create archive.tar from files foo and bar.
  tar -tvf archive.tar         # List all files in archive.tar verbosely.
  tar -xf archive.tar          # Extract all files from archive.tar.
!

# 3.zip
# gunzip (1)           - compress or expand files
# gzip (1)             - compress or expand files
!<<!
$ gzip --help
Usage: gzip [OPTION]... [FILE]...
Compress or uncompress FILEs (by default, compress FILES in-place).
$ gunzip --help
Usage: /usr/bin/gunzip [OPTION]... [FILE]...
Uncompress FILEs (by default, in-place).
!
```

##### Process

```shell
# Process-Manage.sh
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

# 1.View And Find Process
$ ps -ef | grep ma
yihong     171    45  0 14:29 tty2     00:00:00 man ps
yihong     267   106  0 14:36 tty3     00:00:00 grep --color=auto ma
$ pgrep -l ma
171 man
$ top # view gui
$ losf  # All is Files
        # More 1 :https://manpages.debian.org/buster/lsof/lsof.8.en.html
        # More 2 :https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/lsof.html

# 2.Kill Process
$ kill
kill: usage: kill [-s sigspec | -n signum | -sigspec] pid | jobspec ... or kill -l [sigspec]

# 3.monitor process cli:Top
$ top 
<<!
P：根据CPU使用百分比大小进行排序。
M：根据驻留内存大小进行排序。
i：使top不显示任何闲置或者僵死进程。
# https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/top.html#top
!

# 4.Analysis Thread Stack
$ ps -ef | grep man
yihong     171    45  0 14:29 tty2     00:00:00 man ps
yihong     396   106  0 15:01 tty3     00:00:00 grep --color=auto man
$ pmap 171
171:   man ps
00007fd75e175000    200K r---- LC_CTYPE
...

# 5.Use
<<!
example 1,
top
ps -ef | grep vi
kill <pid>
extent-from-network
ps -u colin115 |  awk '/av_/ {print "kill -9 " $1}' | sh
ps -fe| grep colin115|grep HOST |awk '{print $2}' | xargs kill -9;
!
# Note
<<!
1.从查询进程和线程
2.再到分析和追踪
3.再次进行批量处理
4.xargs/awk 需要回顾
!
```

##### Performance

```shell
# Monitor-Performance.sh
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

# 1.Montor CPU、 View Money
<<!
Command SAR（sysstat）
sar - Collect, report, or save system activity information.
    -u [ ALL ] Report CPU utilization. The ALL keyword indicates that all the CPU fields should be displayed
    -r [ ALL ] Report memory utilization statistics. The ALL keyword indicates that all the memory fields should be displayed. 
    -W Report swapping statistics.
free (1)    - Display amount of free and used memory in the system
Example
$ sar -u 2 5 # Report CPU utilization for each 2 seconds. 5 lines are displayed.
$ sar -r -n DEV -f /var/log/sysstat/sa16 # Display memory and network statistics saved in daily data file 'sa16'.
$ free -m
$ sar -w 1 3 # view swap exchange
!
# 2.View Disk
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
rootfs          223G  170G   53G  77% /
none            223G  170G   53G  77% /dev
none            223G  170G   53G  77% /run
none            223G  170G   53G  77% /run/lock
none            223G  170G   53G  77% /run/shm
none            223G  170G   53G  77% /run/user
tmpfs           223G  170G   53G  77% /sys/fs/cgroup
...
$ du -sh
23M

# 3.Use
<<!
Note:
当系统中 sar 不可用时，可以使用以下工具替代：linux 下有 vmstat、Unix 系统有 prstat 。
不同的针对方面有不同的 shell 程序来支持和监控“系统资源”。比如 watch 
当然它们的能够并不止如此，还有更多的功能和应用面，看浏览手册或博文的方式来扩展自己的认知。
合理的利用其他的 shell 程序以达到预期的要求，比如正则表达式、文字过滤、组合脚本；
方向大致如 ：1.过滤信息、2.自动化过滤信息、3.集成化+
!
# Note
<<!
NA
!
```

##### Network

```shell
# Network-Tools.sh
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

# Network-View-Service-And-Port
<<!
netstat
    netstat  - Print network connections, routing tables, 
    interface statistics, masquerade connections, 
    and multi‐cast memberships
    -a, --all    
        Show both listening and non-listening sockets.  With the --interfaces option, show interfaces that are not up
!
$ netstat -a # View All Port
$ netstat -at # View TCP port 
# Extend View UDP prot: $ netstat -au
netstat -l # 所有被监听的服务
# Example1，View Port in What Process
$ netstat -antp | grep 6379
  tcp        0      0 127.0.0.1:6379          0.0.0.0:*               LISTEN      25501/redis-server
$ ps 25501
  PID TTY      STAT   TIME COMMAND
  25501 ?        Ssl   28:21 ./redis-server ./redis.conf
# Example2，View Network in Process
# 1，查询使用该端口的进程的PID；
    $lsof -i:7902
    COMMAND   PID   USER   FD   TYPE    DEVICE SIZE NODE NAME
    WSL     30294 tuapp    4u  IPv4 447684086       TCP 10.6.50.37:tnos-dp (LISTEN) #查到30294
# 2，使用 ps工具查询进程详情：
$ps -fe | grep 30294
tdev5  30294 26160  0 Sep10 ?        01:10:50 tdesl -k 43476
root     22781 22698  0 00:54 pts/20   00:00:00 grep 11554

# Network-Rule
$ route -n
$ Ping
$ host baidu.com
  baidu.com has address 39.156.69.79
$ host 192.168.33.247
  247.33.168.192.in-addr.arpa domain name pointer dc-drk.phd.local.

# Network-Image(download)
$ wget -help
    GNU Wget 1.20.3, a non-interactive network retriever.
    Usage: wget [OPTION]... [URL]...
    -o,  --output-file=FILE          log messages to FILE
    -c,  --continue                  resume getting a partially-downloaded file
         --start-pos=OFFSET          start downloading from zero-based position OFFSET
         --progress=TYPE             select progress gauge type
         --show-progress             display the progress bar in any verbosity mode
    --limit-rate=RATE           limit download rate to RATE


# Network-Service-And-SSH
$ sftp
usage: sftp [-46aCfpqrv] [-B buffer_size] [-b batchfile] [-c cipher]
          [-D sftp_server_path] [-F ssh_config] [-i identity_file]
          [-J destination] [-l limit] [-o ssh_option] [-P port]
          [-R num_requests] [-S program] [-s subsystem | sftp_server]
          destination
$ sftp <ID@host> # Example，root@172.1.1.21
$ ssh
usage: ssh [-46AaCfGgKkMNnqsTtVvXxYy] [-B bind_interface]
           [-b bind_address] [-c cipher_spec] [-D [bind_address:]port]
           [-E log_file] [-e escape_char] [-F configfile] [-I pkcs11]
           [-i identity_file] [-J [user@]host[:port]] [-L address]
           [-l login_name] [-m mac_spec] [-O ctl_cmd] [-o option] [-p port]
           [-Q query_option] [-R address] [-S ctl_path] [-W host:port]
           [-w local_tun[:remote_tun]] destination [command]
$ ssh <id@host> # Example，root@172.1.1.21
# Extend，cli:rsync

# Network-copy
$ scp
usage: scp [-346BCpqrTv] [-c cipher] [-F ssh_config] [-i identity_file]
            [-J destination] [-l limit] [-o ssh_option] [-P port]
            [-S program] source ... target
# Note
# cli : netstat lsof route ping host wget sftp scp
$ netstat # 端口、进程、最终
$ losf # “一切皆为文件”，进程、端口、性能... 超强 ！
$ route # 网络路径管理器
$ ping # ICMP 协议
$ host # 主机解析
$ wget # 下载 Https
$ sftp # 文件传输、同步
$ scp # 网络传输
```

##### User 

```shell
# User-Manage.sh
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

# 1.Manage-User
# View-manucs-to-build（man）
<<!
man -k 'user'
su (1)               - run a command with substitute user and group ID 
useradd (8)          - create a new user or update default new user information
userdel (8)          - delete a user account and related files
usermod (8)          - modify a user account
...
man -k password
passwd (1)           - change user password
...
!
# 2.Manage-Group
$usermod -G groupNmame username # Add User to Group
$usermod -g groupName username # changer group （del old group
$more /etc/passwd # or /etc/group ，View User And Group Information

# 3.User-Permission
# 分为“字母模式”+“数字模式”，进行授权
# $chmod userMark(+|-)PermissionsMark # 格式
# UserMark 值：u 用户 - g 组 - o 其他用户 - a 所有用户
# Permissionsmark 值：r 读 - w 写 - x 执行
# 使用三位八进制数字的形式来表示权限，第一位指定属主的权限，第二位指定组权限，第三位指定其他用户的权限，每位通过4(读)、2(写)、1(执行)三种数值的和来确定权限。如6(4+2)代表有读写权，7(4+2+1)有读、写和执行的权限。
$chown username dirOrFile # Change-Files-Owner | 变更文件拥有者
$chown -R weber server/ # 附加递归方式进行权限变更

# 4.Environment-Config
# /etc/profile，/etc/bashrc 是系统全局环境变量设定
# ~/.profile，~/.bashrc用户目录下的私有环境变量设定

# Note
# useradd passwd userdel usermod chmod chown .bashrc .bash_profile
<<!
顾名思义 ： useradd passwd usermod
Linux 权限（ACL） ：权限分类，读-写-执行
权限管理 ：chmod chown 
个性化指令（Alias）：全局变量、用户变量
!
```

##### System

```shell
# System-Manage.sh
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

# 1.System-Manage
# View-System-Information
$uname -a # View-Linux-Version
$lsb_release # View-Linux-Version
$cat /etc/release # View-Unix-Version
$sar -h # Usage: sar [ options ] [ <interval> [ <count> ] ]
    -u [ ALL ]
    CPU utilization statistics
# or-$cat /proc/cpuinfo
$ cat /proc/cpuinfo | grep process | wc -l # View-Cpu-Process
$cat /proc/meminfo # 内存信息
$getconf PAGESIZE # 内存大小
$arch # CPU-Framework
$date # Set System Time

# 2.IPC$-Manger
ipcs # 附加 grep 可以对一些内存或者进程进行追踪和管理
ulimit # 找到性能的瓶颈，然后对其进行限制（ 优化 ）

# Note
# cli: uname sar arch date ipcs ulimit
<<!
基本信息 uname sar arch 
时间设定 date
进程间通信管理 ipcs ulimit
!
```

#### 2）Advanced

##### Build Program

```shell
# Program-Build.sh
<<!
一般源代码提供的程序安装需要通过配置、编译、安装三个步骤；
1. 配置做的工作主要是检查当前环境是否满足要安装软件的依赖关系，以及设置程序安装所需要的初始化信息，比如安装路径，需要安装哪些组件；配置完成，会生成makefile文件供第二步make使用；
2. 编译是对源文件进行编译链接生成可执行程序；
3. 安装做的工作就简单多了，就是将生成的可执行文件拷贝到配置时设置的初始路径下；
!

# config
# 前提是要把东西下载回来，可用 wget 
# 当然还需要其他的依赖项，见：https://www.debian.org/doc/manuals/maint-guide/build.en.html
./configure --help # 获取帮助
./configure --prefix=/usr/local/snmp # 定位问题

# compile
<<!
$ make -h | more
    Usage: make [options] [target] ...
    -f FILE, --file=FILE, --makefile=FILE # Read FILE as a makefile.
!
$make -f myMakefile
<<!
# makefile编写的要点
必须满足第一条规则，满足后停止
除第一条规则，其他无顺序
# makefile中的全局自变量
$@目标文件名
@^所有前提名，除副本
@＋所有前提名，含副本
@＜一个前提名
@？所有新于目标文件的前提名
@*目标文件的基名称
!
$g++ -o unixApp unixApp.o a.o b.o
<<!
选项说明 ：
-o:指明生成的目标文件
-g：添加调试信息
-E: 查看中间文件
应用：查询宏展开的中间文件：
在g++的编译选项中，添加 -E选项，然后去掉-o选项 ，重定向到一个文件中即可:
g++ -g -E unixApp.cpp  -I/opt/app/source > midfile
!
# install
$make install # 进入自动的配置范围以内

# Note
# cli : configure make install g++
<<!
configure ，查看已存在的文件的包中所支持配置项
make ，基于不同的模式对源码进行”个性化“定制，并生成相关的”程序“
g++ ， 扩展程序构建
install ，安装目标的程序
这个教程所提供的知识完全不够用，扩展新的文档才是正确的做法 ！
!
```

##### Debug Program

```shell
# Debug-Program
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

# 1.Debug-Process（Trace）
# cli : gdb 交互调试， pstack 进程的栈跟踪， strace 系统调用

# gbd ：https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/gdb.html
#       https://www.debian.org/doc/manuals/debian-reference/ch12.zh-cn.html#_basic_gdb_execution
<<!
$gdb programmer     # 启动gdb
>break main         # 设置断点
>run                # 运行调试程序
>next               # 单步调试
>print var1         # 在调试过程中，我们需要查看当前某个变量值的时候，使用print 命令打印该值
>list               # 显示当前调试处的源代码
>info b             # 显示当前断点设置情况
!
<<!
pstack 是一个脚本工具，可显示每个进程的栈跟踪。
pstack 命令必须由相应进程的属主或 root 运行。
其核心实现就是使用了gdb以及thread apply all bt命令;
语法: $pstrack <program-pid>
!
# $pstrack <program-pid>
$pstack 4551
# Thread 7 (Thread 1084229984 (LWP 4552)):
# #0  0x000000302afc63dc in epoll_wait () from /lib64/tls/libc.so.6
# #1  0x00000000006f0730 in ub::EPollEx::poll ()
# #2  0x00000000006f172a in ub::NetReactor::callback ()
# #3  0x00000000006fbbbb in ub::UBTask::CALLBACK ()
# #4  0x000000302b80610a in start_thread () from /lib64/tls/libpthread.so.0
# #5  0x000000302afc6003 in clone () from /lib64/tls/libc.so.6
# #6  0x0000000000000000 in ?? ()
<<!
strace 常用来跟踪进程执行时的系统调用和所接收的信号。
在Linux世界，进程不能直接访问硬件设备，
当进程需要访问硬件设备(比如读取磁盘文件，接收网络数据等等)时，必须由用户态模式切换至内核态模式，
通过系统调用访问硬件设备。
strace可以跟踪到一个进程产生的系统调用,包括参数，返回值，执行消耗的时间。
!
# Example
$strace -o output.txt -T -tt -e trace=all -p 28979
# 跟踪28979进程的所有系统调用（-e trace=all），
# 并统计系统调用的花费时间，以及开始时间（以可视化的时分秒格式显示），
# 最后将记录结果存在output.txt文件里面。
$strace -p <process-pid> # 实时查看
# extent https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/strace.html#strace

# 2.Analysis
# cli ：nm objdump readelf size file strings fuser xxd od

$ whatis nm
# nm (1)               - list symbols from object files 列出文件的符号信息
$nm myProgrammer
# 08049f28 d _DYNAMIC
# 08049ff4 d _GLOBAL_OFFSET_TABLE_
# ...
<<!
常见的各种编码包括：
A 表示绝对 (absolute)，这意味着不能将该值更改为其他的连接；
B 表示 BSS 段中的符号；
C 表示引用未初始化的数据的一般符号。
可以将目标文件中所包含的不同的部分划分为段。段可以包含可执行代码、符号名称、初始数据值和许多其他类型的数据。有关这些类型的数据的详细信息，可以阅读 UNIX 中 nm 的 man 页面，其中按照该命令输出中的字符编码分别对每种类型进行了描述。
在目标文件阶段，即使是一个简单的 Hello World 程序，其中也包含了大量的细节信息。
nm 程序可用于列举符号及其类型和值，
但是，要更仔细地研究目标文件中这些命名段的内容，需要使用功能更强大的工具。（比如 objdump readelf）
!

$ whatis objdump
# objdump (1)          - display information from object files. 了解二进制的附加细信息
$objdump -d myprogrammer
# a.out:     file format elf32-i386
# Disassembly of section .init:
# 080482b4 <_init>:
#  80482b4:   53                      push   %ebx
#  80482b5:   83 ec 08                sub    $0x8,%esp
#  ...
<<!
每个可执行代码段将在需要特定的事件时执行，这些事件包括库的初始化和该程序本身主入口点。
可用于研究编译器和汇编器的输出。
!

$ whatis readelf
# readelf (1)          - Displays information about ELF files.
# objdump命令提供的功能类似，但是它显示的信息更为具体，并且它不依赖BFD库(BFD库是一个GNU项目，它的目标就是希望通过一种统一的接口来处理不同的目标文件）
$readelf -all a.out
# output ...
# ELF Header 为该文件中所有段入口显示了详细的摘要。在列举出这些 Header 中的内容之前，您可以看到 Header 的具体数目。在研究一个较大的目标文件时，该信息可能非常有用。
# 调试工具，如 GDB，可以读取这些调试信息，并且当程序在调试器中运行的同时，您可以使用该工具显示更具描述性的标记，而不是对代码进行反汇编时的原始地址值。

$ whatis size
# size (1)             - list section sizes and total size.
# size这个工具用来查看程序运行时各个段的实际内存占用:

$ whatis file
# file (1)             - determine file type
# 这个工具用于查看文件的类型；
# 比如我们在64位机器上发现了一个32位的库，链接不上，这就有问题

$ whatis strings
# strings (1)          - print the strings of printable characters in files.
# 一个文件中包含二进制数据和文本数据，如果只需要查看其文本信息，使用这个命令就很方便；过滤掉非字符数据，将文本信息输出:

$ whatis fuser
# fuser (1)            - identify processes using files or sockets
# 显示所有正在使用着指定的file, file system 或者 sockets的进程信息;
$fuser -m -u redis-server
# redis-server: 11552rce(weber) 22912rce(weber) 25501rce(weber)

$ whatis xxd
# xxd (1)              - make a hexdump or do the reverse.
# 以十六进制方式显示文件

$ whatis od
# od (1)               - dump files in octal and other formats
# 通常使用od命令查看特殊格式的文件内容。通过指定该命令的不同选项可以以十进制、八进制、十六进制和ASCII码来显示文件。

# Note
<<!
更接近底层的系统基础建设，对程序进行查看、追踪和分析，以此协助其他关键的作业进行决策和调查。
分为两大部分，信息收集与追踪（Debug）、信息分析（Analysis）
（以下基于思路，脑子回路）
0.发现问题、或需要测试问题
1.在收集阶段
debug 收集信息，并在初步内进行初步分析 
包括不限于，strace strace
pstack 是一个脚本工具，可显示每个进程的栈跟踪。
strace 常用来跟踪进程执行时的系统调用和所接收的信号。
2.在分析阶段
对目标进行分析和深度追踪
查看系统接口、二进制系统编码、内存查询、文件类型、文本过滤、进制转换 ...
（ cli ：nm objdump readelf size file strings fuser xxd od ）
根据不同的需求，进行不同的角度进行分析，可以根据内存的角度、文件系统的角度进行问题的分析和处理
其他作业类似，但需要更加深入的学习和使用，有门槛 ！
!
```

##### Optimal performance

```shell
# Optimal-performance.sh
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

# 1.Analysis-Performance

# About-Main
$ whatis top
top (1)              - display Linux processes
# About-Memory
$ whatis free
free (1)             - Display amount of free and used memory in the system
# About-IO
$ iostat
# Report  Central Processing Unit (CPU) statistics and input/output statistics for devices and parti‐tions.
# About-Process
$ pstack # 追踪进程堆
$ pstrace # 追踪进程和线程

# 2.Optimal-Performance

<<!
对于代码部分，先不做考虑。
更多考虑到关于于计算机的性能和资源管理问题。
基本上是哪里不足补充哪里的问题，短板补全的问题，比如 IO 性能问题，就提升 IO.
在资源上扩展:线程扩展\SQL调优
(由于没有实际的遇到实际的情况,此条目作为待定)
!

# Note

<<!
没有实际涉及到,用大脑自动脑补这些事情,确实是不易的行为.
动起来吧,毕竟能够学习到相关的思路:
1.IO(读\写)
2.代码指令(关于脚本的语言开发)
3.SQL内部(另一个信息系统的应用)
4.综合服务管理
5....
!
```

#### 3）Tool Reference

Read on demand

> - [1. gdb 调试利器](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/gdb.html)
> - [2. ldd 查看程序依赖库](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/ldd.html)
> - [3. lsof 一切皆文件](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/lsof.html)
> - [4. ps 进程查看器](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/ps.html)
> - [5. pstack 跟踪进程栈](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/pstack.html)
> - [6. strace 跟踪进程中的系统调用](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/strace.html)
> - [7. ipcs 查询进程间通信状态](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/ipcs.html)
> - [8. top linux下的任务管理器](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/top.html)
> - [9. free 查询可用内存](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/free.html)
> - [10. vmstat 监视内存使用情况](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/vmstat.html)
> - [11. iostat 监视I/O子系统](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/iostat.html)
> - [12. sar 找出系统瓶颈的利器](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/sar.html)
> - [13. readelf elf文件格式分析](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/readelf.html)
> - [14. objdump 二进制文件分析](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/objdump.html)
> - [15. nm 目标文件格式分析](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/nm.html)
> - [16. size 查看程序内存映像大小](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/size.html)
> - [17. wget 文件下载](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/wget.html)
> - [18. scp 跨机远程拷贝](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/scp.html)
> - [19. crontab 定时任务](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/crontab.html)



#### 4）Appendix

[Linux Tools Quick Tutorial - Readthedocs](https://linuxtools-rst.readthedocs.io/zh_CN/latest/index.html)

[Linux - Wikipediaen.wikipedia.org](https://en.wikipedia.org/wiki/Linux)

