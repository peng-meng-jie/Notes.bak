# Get-Help
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

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
whatis，查找程序和帮助（简要信息）
info man，查找程序和帮助（具体信息）
which，程序路径
whereis，构建文件和路径
!