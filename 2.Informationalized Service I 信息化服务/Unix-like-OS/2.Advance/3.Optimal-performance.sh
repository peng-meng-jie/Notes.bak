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
