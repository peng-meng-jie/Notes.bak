# CCNA_node

内容为节选，如下：

- 交换机路由器 telnet 的配置
- 对于交换机路由器的接口IP配置
- VLAN 的基本配置
- 路由协议 RIP、EIGRP、OSPF 的简单配置
- 基本的 show 命令
- 基本的网络排错能力（ping，traceroute，telnet，arp）

目的层次：掌握、了解、”从概念到概念理“

[TOC]

## 一. Route、Telnet（or SSH）、 IP config

### 1. 模拟器

对于基础知识的实践性有很大的作用，可以帮助你更好的学习网络知识；

比如：VLAN、Route、Route CLI、LAN 等等的子应用领域，是路由器有效且可观的“战争沙盘”；

> 搭建示例：[GNS3 Route 模拟器 - 环境构建示例](https://www.kjnotes.com/devtools/53)

### 2. Route

用一台电脑主机来理解吧.

<u>接口分类/存储芯片/外观机箱/系统启动流程/初始化配置</u>

这里全都不讨论，太基础了是必备的啊

### 3. Telnet and SSH

为你的 Route 搭建一条初始化的”通道“，Telent 或者 SSH 还有实体机操作。不做描述，请参阅网络资源和配置手册。

### 4. IP config

基本 CLI 是必须的，请查阅本文第 4 点。

**Notes**

基本也是从概念到概念，暂无实际操作，Pending - 2020/05/22



## 二. VLAN

> **虚拟局域网**（**Virtual Local Area Network**或简写**VLAN**, **V-LAN**）是一种建构于局域网交换技术（LAN Switch）的[网络管理](https://zh.wikipedia.org/wiki/網絡管理)的技术，网管人员可以借此透过控制[交换机](https://zh.wikipedia.org/wiki/交換器)有效分派出入局域网的报文到正确的出入端口，达到对不同实体局域网中的设备进行逻辑分群（Grouping）管理，并降低局域网内大量数据流通时，因无用报文过多导致壅塞的问题，以及提升局域网的信息安全保障。	-- Wikipedia # VLAN
>
> **作用**
>
> 广播控制、宽带利用、降低延迟、安全性（非设计作用，本身功能附带属性）；”利用技术把它们圈起来管理“

**三种应用方式**

1. 物理层，以交换机的接口为划分 VLAN 基础，适用于小规模范围；
2. 数据链路层，以 MAC 地址为划分 VLAN 基础，管理员作为中间管理者初始化每一个 MAC 地址，工作量随基数的变化而变化（同步增长）；
3. 网络层，以设备 IP 作为划分 VLAN 的基础，预设分配 IP，降低[交换机](https://zh.wikipedia.org/wiki/交換器)接收与分派报文的效率；

大多数取决于其供应商提供的支持方式，一般以上面 3 条基础；

**Pending**

- 实例业务的运行示例	-- 参考附录链接
- VLAN：PVLAN、中继协议、通讯（二层到三层）、VMPS、帧；

<u>Notes：20/05/19 从概念到概念 # Pass</u>



## 三. Route 协议（节选）

Route 即是网络道路，以下协议涉及配置、维护、计算网络的通道。了解即可。

### 1. RIP

> RIP是Routing Information Protocol（路由信息协议）的简称，它是一种较为简单的内部网关协议（Interior Gateway Protocol）。RIP是一种基于距离矢量（Distance-Vector）算法的协议，它使用跳数（Hop Count）作为度量来衡量到达目的网络的距离。RIP通过UDP报文进行路由信息的交换，使用的端口号为520。
>
> RIP包括RIP-1和RIP-2两个版本，RIP-2对RIP-1进行了扩充，使其更具有优势（但存在兼容性问题）。	-- Blog
>
> 
>
> **路由信息协议**（英语：**R**outing **I**nformation **P**rotocol，缩写：**RIP**）是一种[内部网关协议](https://zh.wikipedia.org/wiki/内部网关协议)（IGP），为最早出现的[距离向量路由协议](https://zh.wikipedia.org/wiki/距離向量路由協定)。属于[网络层](https://zh.wikipedia.org/wiki/網絡層)，其主要应用于规模较小的、可靠性要求较低的网络，可以通过不断的交换信息让[路由器](https://zh.wikipedia.org/wiki/路由器)动态的适应网络连接的变化，这些信息包括每个路由器可以到达哪些网络，这些网络有多远等。
>
> 虽然RIP仍然经常的被使用，但是由于收敛慢和支持的广播网络规模有限等缺点，许多人认为它将会而且正在被诸如[OSPF](https://zh.wikipedia.org/wiki/OSPF)和[IS-IS](https://zh.wikipedia.org/wiki/IS-IS)这样的路由协议所取代。当然，我们也看到[EIGRP](https://zh.wikipedia.org/wiki/EIGRP)，一种和RIP属于同一基本协议类但更具适应性的路由协议，也有被使用。	-- Wikipedia # RIP
>
> 
>
> **Pending** 
>
> RIP 1、2 的报文、数据发送和接收规则、特点、工作流程、路由表、更新与维护、兼容性、配置；
>
> 防止网络环路：水平分割、毒性逆转、抑制定时器、触发更新；

**Notes**
工作的流程类似：可限制循环圈，平均发送没有返程（水平分割）、发送不接受返程（毒性逆转）。

用于内部网关，链路计算配置与搭建，用于搭建“网络高速线路”。

### 2. EIGRP

> **加强型网关间选径协议**（英语：Enhanced Interior Gateway Routing Protocol，缩写为EIGRP），又译**增强型内部网关路由协议**，一种[内部网关协议](https://zh.wikipedia.org/wiki/内部网关协议)（IGP）。在[内部网关路由协议](https://zh.wikipedia.org/wiki/内部网关路由协议)（IGRP）的基础上，由[思科](https://zh.wikipedia.org/wiki/思科)公司发展而成，于2013年[Cisco](https://zh.wikipedia.org/wiki/Cisco)将此标准公开，不再是私有的[路由协议](https://zh.wikipedia.org/wiki/路由协议)[[1\]](https://zh.wikipedia.org/wiki/加強型閘道間選徑協定#cite_note-1)，在同样。EIGRP是一种高级[距离矢量路由协议](https://zh.wikipedia.org/wiki/距离矢量路由协议)（也称混合型路由协议）	-- Wiki
>
> 
>
> Pending
>
> 涉及：EIGRP 特性、数据结构、负载与验证、算法与计算、配置与维护

**Notes**

进阶版的 RIP，可混合使用。

### 3. OSPF

相对本文中两条协议，此协议个给了我全新的感觉，基于不同算法、设计理念、工作理念等。无奈基础知识薄弱，无力支撑理解该协议只好设为待定状态。

> [OSPF 开放式最短路径优先  -- Wikipedia](https://zh.wikipedia.org/wiki/开放式最短路径优先)
>
> [OSPF  -- Huawei Technical Support](https://support.huawei.com/enterprise/zh/doc/EDOC1100082073)

Notes：基于块管理，模组化。

Pending



## 四. Route CLI

储备基本的知识，「配置指南」很重要

> 参阅官方“保姆级别”的文档：[Using the Cisco IOS Command-Line Interface（EN）](https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/fundamentals/configuration/15mt/fundamentals-15-mt-book/cf-cli-basics.html)

Point: CLI 手册/增删改查/上下文记录/提示符，其他的就看个人的熟练程度\基础\经验知识的储备了．



## 五. 基础的网络排错

elected：ping、traceroute、telnet、arp

### 1. Ping and Tracetoute

1. IP 寻址排错（ Ping ）

1. TCP/IP 协议：Ping 127.0.0.1，可确认 TCP/IP 协议是否正常工作；
2. 网卡：Ping 本机 IP，可确认网卡是否正常工作；
3. 局域网：Ping 同等网段或局域网服务器，可测试局域网是否连接正常；
4. Internet：Ping baidu.com，测试 WAN 的连接性；

2. Tracerouter

Linux 为 traceroute、Windows 为 tracer，已路由的跳点为基础，一次分别跳转一个路由。

可选择选项：响应时间、域名地址、请求数量、IP、域名。

Notes：网关跳转，记录网关；

### 2. ARP

发送广播 arp -a 即可获得已连接过的主机 IP 和 MAC 的地址。

比如 确认 IP 和 MAC 地址，或查看多态路由连接表（交换路由上使用）。

### 3. Windows Use SSH and Telnet

使用 PuTTY 

> [PuTTY: a free SSH and Telnet client](https://www.chiark.greenend.org.uk/~sgtatham/putty/)
>
> [PuTTY Portable](https://portableapps.com/apps/internet/putty_portable)

备注：虽然 Windows 系统本身就支持  Telnet ，但是关闭或者开启该功能都需要通过重启菜呢完成设置，不方便也不推荐。



## Appendix

### 1. 外部链接

**Link**

1. [思科知识汇总 - 部分](https://bbs.hh010.com/thread-529979-1-1.html)
2. [VLAN 配置 -- Huawei Technical Support](https://support.huawei.com/view/contentview!getFileStream.action?mid=SUPE_DOC&viewNid=EDOC0000645513&nid=EDOC0000645513&partNo=j006&type=htm)
3. [Configuration Guides  -- CISCO Support](https://www.cisco.com/c/en/us/support/ios-nx-os-software/ios-15-4m-t/products-installation-and-configuration-guides-list.html)
4. [GNS3 Docs](https://docs.gns3.com/)
5. [OSPF  -- Huawei Technical Support](https://support.huawei.com/enterprise/zh/doc/EDOC1100082073)
6. [OSPF 开放式最短路径优先  -- Wikipedia](https://zh.wikipedia.org/wiki/开放式最短路径优先)

**Blog**

1. [网络学习和 CCIE 认证](https://ciscochina.github.io/engineering/network/2017/07/18/network-path.html)
2. [RIP 基础知识](https://cshihong.github.io/2018/03/23/RIP基础知识/)
3. [VLAN 命令行配置](https://cshihong.github.io/2017/11/05/VLAN命令行配置/)
4. [[CCNA 图文笔记]-20- VLAN 配置实例详解](https://www.qingsword.com/qing/617.html)



### 2. 基础补充

2.1 ARP 

ARP 是地址解析协议，它的作用是在以太网环境下，通过3层的IP地址来找寻2层的MAC地址，得到一张ARP缓存表。转发数据的时候根据ARP缓存表来进行传输。

> 地址解析协议（英语：Address Resolution Protocol，缩写：ARP）是一个通过解析网络层地址来找寻数据链路层地址的网络传输协议，它在IPv4中极其重要。
>
> 在以太网协议中规定，同一局域网中的一台主机要和另一台主机进行直接通信，必须要知道目标主机的MAC地址。而在TCP/IP协议中，网络层和传输层只关心目标主机的IP地址。这就导致在以太网中使用IP协议时，数据链路层的以太网协议接到上层IP协议提供的数据中，只包含目的主机的IP地址。于是需要一种方法，根据目的主机的IP地址，获得其MAC地址。这就是ARP协议要做的事情。所谓地址解析（address resolution）就是主机在发送帧前将目标IP地址转换成目标MAC地址的过程。
>
> 另外，当发送主机和目的主机不在同一个局域网中时，即便知道对方的MAC地址，两者也不能直接通信，必须经过路由转发才可以。所以此时，发送主机通过ARP协议获得的将不是目的主机的真实MAC地址，而是一台可以通往局域网外的路由器的MAC地址。于是此后发送主机发往目的主机的所有帧，都将发往该路由器，通过它向外发送。这种情况称为委托ARP或ARP代理（ARP Proxy）。
>
> 在点对点链路中不使用ARP，实际上在点对点网络中也不使用MAC地址，因为在此类网络中分别已经获取了对端的IP地址。
>
> --- Wikipedia #ARP

Notes：
1.通过网络地址（IP and MAC）解析，使其双方可以相互通讯，过程为 IP 转 MAC；

2.分布式（跨地域）局域网不能直接连接，必须经过路由转发（比如 ARP Porxy-VPN 代理）实现数据访问；