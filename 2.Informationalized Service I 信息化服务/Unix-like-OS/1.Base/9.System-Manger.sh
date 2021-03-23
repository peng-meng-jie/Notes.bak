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

