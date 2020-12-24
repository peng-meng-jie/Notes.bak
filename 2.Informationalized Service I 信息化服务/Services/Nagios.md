# Nagios

主要是集中对**主机和网络服务**的资源监管，可使用官方插件同事也支持自主开发插件实现定制化的用途需求，可以节省人力投入资源成本的管理。是一种资源的统筹信息管理，减低 IT 的管理成本。PS：服务器集成的高速发展计算机协助人统计资源信息，这必然的发展，否则人类难以进步。

### 1. Nagios

**结构与机制**

① 结构

主要分为核心和插件，核心程序不集成大量的服务插件。需要可以到官网下载或自定义开发。

② 机制

「监控中心（Linux）」- ”插件“通信 - 「 其他主机或服务（Linux、Windows）」

搭建一个监控主机 LAN 服务器，通过插件通讯（来路不明的网络协议）上传主机和服务信息到服务，服务器代理人工监管服务器集群的故障异常和资源统计。

其运行机制如下图

![Nagios 监控原理图](https://www.ibm.com/developerworks/cn/linux/1309_luojun_nagios/image003.jpg)

**用途**

> - **网络服务**监控（SMTP、POP3、HTTP、NNTP、ICMP、SNMP、FTP、SSH）
> - **主机资源**监控（CPU load、disk usage、system logs），也包括Windows主机（使用NSClient++ plugin）
> - 可以指定自己编写的Plugin通过网络收集数据来监控任何情况（温度、警告……）
> - 后面信息省略, 需要时参考: [Nagios # 主要功能](https://zh.wikipedia.org/wiki/Nagios#主要功能)  -- Wikipedia

Notes：以上信息为节选，更多信息请查阅官网

### 2. Application

#### Build

> [CentOS 7](https://www.rultr.com/tutorials/vps/3741.html)
>
> Note：目前查阅到信息表明只能在 Linux 上搭建服务器，Linux for Debian 请配合 Google 使用

#### 扩展

>  [编写自定义 Nagios 插件](https://www.ibm.com/developerworks/cn/aix/library/au-nagios/index.html)  -- IBM

### 附录

**Link**

1.  [Nagios](https://zh.wikipedia.org/wiki/Nagios)  -- Wikipedia
2. [Nagios 监控系统架设全攻略](https://www.ibm.com/developerworks/cn/linux/1309_luojun_nagios/index.html)  -- IBM
3. [Nagios Docs](https://www.nagios.org/documentation/)



