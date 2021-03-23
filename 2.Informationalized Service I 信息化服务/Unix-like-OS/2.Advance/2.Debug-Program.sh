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