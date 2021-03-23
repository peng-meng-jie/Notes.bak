# File-Folder-Management.sh
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

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
+ 批处理命令连接执行，使用 |                (command-1 | command-2)
+ 串联: 使用分号 ;                         (command-1 ; command-2)
+ 前面成功，则执行后面一条，否则，不执行:&&  (command-1 %% command-2)
+ 前面失败，则后一条执行: ||                (command-1 || command-2)
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

