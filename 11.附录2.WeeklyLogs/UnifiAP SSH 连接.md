# Ubnt (Unifi) AP SSH

必须： ① 管理员的 ssh 账号和密码；

​			 ② （Ubnt）Switch Control 的账号和密码；

## 1. SSH

**Windows SSH**

微软系统嵌套的 SSH 客户端

>  **提示**:  Windows 10 确实包括 SSH 客户端，但默认情况下未安装。这是有关如何启用它的[外部教程 (英文)](https://fossbytes.com/enable-built-windows-10-openssh-client/)。

开源、多平台：[PuTTY](https://www.putty.org/)

> **1.打开 PuTTY：** 在 *PuTTY 会话*的“ *基本”选项*屏幕上，在“主机名”下输入要连接的设备的 IP 地址，并将“ *端口”*保留为22，除非已明确更改了设备的 SSH 端口。**点击打开**。
>
> **2.单击“ \*是”\*使 PuTTY 将主机密钥缓存为受信任的主机：** 如果这是您第一次使用此客户端连接到此设备，则会出现一个对话框，警告您服务器的主机密钥未在注册表中缓存。单击 *是*。 
> 在[此处](http://the.earth.li/~sgtatham/putty/0.67/htmldoc/Chapter2.html#gs-hostkey)找到有关主机密钥的更多信息。 
>
> **3.输入设备的用户名：** PuTTY 将打开一个控制台窗口，并显示“ *登录为：”*提示。输入设备的用户名，然后按 *Enter*。

## 2. Ubnt SUPPORT 

**示例：网络环路**

> 通过运行 tcpdump 在相关 UAP 和/或 UniFi 交换机上抓取数据，通过 Wireshark 等工具中查看分析，可以轻松检测网络环路。按照以下步骤执行此操作：
>
> 1. SSH 到出现问题的 UAP 上 ，并输入以下命令：
>
> tcpdump -i br0 -n -v -s 0 -w /tmp/capture.pcap
> 2.然后将生成的 pcap 文件复制到笔记本电脑，以便在 Wireshark 中查看。
>
> scp admin@192.168.1.X:/tmp/capture.pcap /tmp
> 此操作会将 capture.pcap 复制到计算机上的 /tmp 目录下。如果是 Windows 系统，您可以使用 winscp。
>
> 3. 在 Wireshark 中打开文件。
>
> 如果某处存在网络环路，您将在捕获文件中看到大量的多播或广播流量。典型网络的组播/广播流量小于 100 kbps，每秒总共只有几十个数据包。如果每秒有数千个多播/广播数据包，那么您可能在某个地方需要解析网络环路。保持断开基础设施设备的连接，直到多播/广播数据包的数量下降到合理的数量。

Notes：[UniFi - 连接问题故障排除](https://help.ubnt.com.cn/hc/zh-cn/articles/360000237441)

## 附录

1.[Open SSH For Windows](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse)

2.[Ubnt Support CN](https://help.ubnt.com.cn/hc/zh-cn)

3.[PuTTY]([PuTTY](https://www.putty.org/))

