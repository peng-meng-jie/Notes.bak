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
