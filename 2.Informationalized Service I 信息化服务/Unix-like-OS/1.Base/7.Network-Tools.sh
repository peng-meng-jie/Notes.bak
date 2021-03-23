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
