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



