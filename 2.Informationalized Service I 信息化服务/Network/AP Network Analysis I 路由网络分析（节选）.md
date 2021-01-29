#### AP Network Analysis 

本文以 UAP 为例，测试 AP 网络中存在的异常，比如网络环路、信道冲突、改进 AP 部署、性能测试等；

#### 1. 信息收集

网络架构

无线网络架构，

硬件：树形网络架构，三级

> 防火墙 - Control - AP

软件：Server - Control - AP

> SSID - AP - 【 Control switch  -  VLAN * 2  - LAN - Server（uap control）】



#### 1.1 目前固有信息

**基础设施环境**

部署环境涉及大量的家用路由器、金属或泥土围墙、暂无发现其他发射电磁波的设备；

**基础设备**：unifi switch、unifi ap、VPN

> |              | [UAP-AC-LITE](https://ui.com.cn/unifi/unifi-ap-ac-lite/) |                         | [UAP-AC-PRO](https://ui.com.cn/unifi/unifi-ap-ac-pro/) |                        |                        |
> | ------------ | -------------------------------------------------------- | ----------------------- | ------------------------------------------------------ | ---------------------- | ---------------------- |
> | 尺寸         | ∅160 x 31.45 mm                                          | ∅175.7 x 43.2 mm        | ∅196.7 x 35 mm                                         | ∅287.5 x 125.9 mm      | ∅220 x 48.1 mm         |
> | 使用环境     | 室内                                                     | 室内                    | 室内/室外                                              | 室内                   | 室内/室外              |
> | 2.4 GHz 速率 | 300 Mbps                                                 | 450 Mbps                | 450 Mbps                                               | 450 Mbps               | 800 Mbps               |
> | 5 GHz 速率   | 867 Mbps                                                 | 867 Mbps                | 1300 Mbps                                              | 1300 Mbps              | 1733 Mbps              |
> | PoE 模式     | 802.3af/A PoE & 24V PoE                                  | 802.3af/A PoE & 24V PoE | 802.3af PoE/802.3at PoE+                               | 802.3at PoE+           | 802.3at PoE+           |
> | 端口         | (1) 10/100/1000 以太网                                   | (1) 10/100/1000 以太网  | (2) 10/100/1000 以太网                                 | (2) 10/100/1000 以太网 | (2) 10/100/1000 以太网 |
> Note：参阅官方信息

**软件平台**： control center ui（Windows）；

**模式**：双频、“双端”；

**网络拓扑**（3 ~ 5 层树形网络结构）

> 1. Internet - route -  switch
> 2. switch - ap
> 3. switch - switch -ap



#### 1.2 无线“抓包”信息

工具：WIRESHARK、Iperf、Ping、winscp；

范围：ARP、网络环路、WIFI 信道、信号、Ping（WeChat、LAN）、Iperf3；

##### A、网络环路

ARP  1~3 /s （1 秒内发送 1~3 数据包）、ARP 报文长度、IO 数据传输（ARP 是类似 UDP 的协议，即网络广播）；

> 小结
>
> 1. 平均值 ARP 每秒 20 个数据包
> 2. IO 数据最高峰报文使用率（怀疑 Vmware 虚拟主机 33.196，数据 IO 到达 70+ ）
>
> 对策
>
> 排除法、网络硬件资源管理、拔网线！



##### B、Iperf 3（传输上限）

对网络的传输上限进行测试，

> 由于当前网络已做了策略，不支持双向传输，此处仅收集单项测试（数据接收）；
>
> 1. 网络 down 上限为 5M/s；
> 2. 平均为 2.5~3.8M/s；
> 3. 理论上支持 15 人以内同时连接此 UAP；
>
> 额外信息
>
> 1. 单项传输，广播方向不可逆；
> 2. 可以尝试一下网站追踪功能；
>
> 补充
>
> 最好是把所有的配置文件调整到最优的状态
>
> 涉及：传输协议、信道频率、实体距离、网络接口，确保它处于最优的状态，已测试该设备的最优性能。



##### C、WiFi 信道与功率

PS：先排除此选项

2.4 GHz 14 信道，5 GHz ？信道，可以叠加频率（即信号功率），也有干扰信道的困扰。

>  AP 的发射功率决定了其射频信号的覆盖范围，AP功率越大，其覆盖范围也就越大。传统的射频功率控制方法只是静态地将发射功率设置为最大值，单纯地追求信号覆盖范围，但是功率过大可能对其他无线设备造成不必要的干扰。因此，需要选择一个能平
> 衡覆盖范围和信号质量的最佳功率。功率调整就是在整个无线网络的运行过程中，根据实时的无线环境情况动态地分配合理的功率。

信道待扫描（control ui 或者手动的第三方工具）

> 1. 位于宿舍区域，涉及多个 WIFI 信道，存在一定的干扰；
> 2. UAP 当前默认为双频双信号发射模式，行政 UAP 一共为 3 个，一个 UAP 就有 4 个 WLANs 信号；
> 3. （途径）默认频道自动配置，当然也可以通过 control ui 扫描通道；

功率

> 当前 UAP 设定：
>
> 已设置为最强的信道：HT 20（2.4GHz）、VHT 80 （5GHz）
>
> 默认 dBm 为 20dBm（AC） 22dBm（AC PRO） 
>
> 社区白话文描述：高发射功率 **仅能够扩展覆盖范围范围，并不能提高传输效率，因为较高的传输效率是在较低的发射功率下进行的，这对所有厂商的 AP 和终端来说都一样** 。在多 AP 部署的情况下，高发射功率会占用更多空口时间，从而减慢整个网络的速率，并可能导致较高的丢包率。
>
> 在此情况下，“车间”比较适合高频高压，以增强信号的覆盖和传输能力；
>
> 此为，“办公区”适当的减低频率电压，以减少频道的相互干扰提高稳定性；

Note

目前的 UAP 规划的理念为：1. 要求覆盖率广（车间）；2. 要求稳定（单独房间部署）；

假设：（根据实际情况）可以优化和调整的配置，1. 办公区 AP 位置变更到通道或门口（均衡）；2. 车间 AP 选择广阔和围墙较薄的地方（发挥最大性能）；



#### 1.3 辅助工具

##### WireShark

操作：支持 CLI 和 GUI 操作，需具备一定的网络基础；

简直就是网路高速路的通道分析工具，能够区分“各种各类的汽车”的启动顺序、速度、重量等，一目了然。

PS：上手存在一定的难度。涉及特定的 CLI、GUI、Route 协议、网络协议等等；





#### 2. 应用

##### 2.1 无法获取 IP

##### 2.1.1 Logs Analysis

Route and Control Logs Analysis

最具价值的信息，如下的：event_type":"soft failure"

```markdown
Tue Nov 17 16:03:08 2020 user.info : stahtd[3242]: [STA-TRACKER].stahtd_dump_event(): {"message_type":"STA_ASSOC_TRACKER","vap":"ath0","mac":"7c:2a:db:42:7e:22","event_type":"soft failure","assoc_status":"0","ip_assign_type":"roamed","auth_ts":"7952018.498994","auth_delta":"0","assoc_delta":"10000","event_id":"2"}

```

Note：

无法获取相关信息，下一步 Debug DHCP 



##### 2.1.2 Troubleshoot DHCP

Debug DHCP

基础信息

> VLAN 172.20.110.X
>
> DHPC 防火墙172.20.110.254，IP range 100~200
>
> UAP 

DHCP 协议

> DHCP统一使用两个IANA分配的端口作为BOOTP：服务器端使用67/udp，客户端使用68/udp。
>
> DHCP运行分为四个基本过程，分别为<u>请求IP租约、提供IP租约、选择IP租约和确认IP租约</u>。
>
> 客户在获得了一个IP地址以后，就可以发送一个ARP请求来避免由于DHCP服务器地址池重叠而引发的IP冲突。

Debug 

监控端口，并统计相关信息，然后设法模拟环境。

> [对 DHCP 客户机配置问题进行故障排除 Linux](https://docs.oracle.com/cd/E24847_01/html/819-7058/dhcp-trouble-5.html)

#### X. Appendix

##### 1.1 Element

> 引用术语

EIRP

> 有效全向辐射功率EIRP（Effective Isotropic Radiated Power），即天线端发射
> 出去时的信号强度

RSSI

> 接收信号强度指示RSSI（Received Signal Strength Indicator），指示无线网络
> 覆盖内某处位置的信号强度，是EIRP经过一段传输路径损耗和障碍物衰减后的值。网
> 规遇到的信号强度弱问题就是指RSSI弱，没有达到指标要求值，导致无线终端接收到
> 很弱的信号甚至接收不到信号。

dB

> dB 是一个纯计数单位，它的计算公式为dB = 10lg（A / B）。
>
> 当A和B表示两个功率时，dB就表示两个功率的相对值，例如A的功率为100mW，B的
> 功率为10mW，则10lg（100 / 10） = 10dB，表示A比B大10dB。如果A的功率变为
> 10000mW，则10lg（10000 / 10） = 30dB。

dB主要作为信噪比及损耗的单位。

dBm

> dBm即分贝毫瓦，是功率值与1mW的比值，表示功率绝对值的单位。m表示mW，
> dBm可以与功率单位mW相互转换，计算公式为：dBm = 10lg（功率值 / 1mW）。

信号衰减与干扰

衰减，障碍物、传输距离、频率（电磁波）

干扰

> 干扰是指系统本身以及异系统带来的干扰，如同频干扰、多径干扰。
>
> 噪声是指经过设备后产生的原信号中并不存在的无规则的额外信号，这种信号与
> 环境有关，不随原信号的变化而变化。
>
> 信噪比SNR（Signal-to-noise Ratio），指的是系统中信号与噪声的比。
>
> 信干噪比SINR（Signal to Interference plus Noise Ratio），指的是系统中信号与干扰和噪声之和的比。

##### 1.2 Reference

1. Network Tools

   [WIRESHARK](https://www.wireshark.org/)

   [Iperf](https://iperf.fr/)

   [Putty（SSH）](https://www.putty.org/)

   [winscp](https://winscp.net/)

2. Wikipedia

   [ARP](https://zh.wikipedia.org/wiki/地址解析协议)

   [WiFi](https://zh.wikipedia.org/wiki/Wi-Fi)

   [无线接入点（WAP）](https://zh.wikipedia.org/wiki/無線接入點)

3. [UAP 连接问题故障排除](https://help.ui.com.cn/hc/zh-cn/articles/360000237441-UniFi-连接问题故障排除#h_2274f5f3-0105-4c3c-b219-d23f6f4c1012)

4. [Wireshark 指导 -- DELL Support](https://www.dell.com/community/入门级和中端/如果看了这个你还是不会用Wireshark-那就来找我吧-8月6日完结/td-p/7007033)

5. [WireShark Docs](https://www.wireshark.org/docs/)

6. [无线规划与设置 Huawei Docs](https://support.huawei.com/enterprise/zh/doc/EDOC1000113314/2a478e25)

   [WLAN 性能测试](https://support.huawei.com/enterprise/zh/doc/EDOC1100081209)

7. [UniFi-UAP配置不同SSID获得不同VLAN的DHCP-IP案例](https://bbs.ui.com.cn/t/unifi-uap-ssid-vlan-dhcp-ip/41579)

8. Ubiquiti Help

   [UniFi-Troubleshooting-Connectivity-Issues](https://help.ui.com/hc/en-us/articles/221029967-UniFi-Troubleshooting-Connectivity-Issues)

   [UniFi - Methods for Capturing Useful Debug Information](https://help.ui.com/hc/en-us/articles/227129127-UniFi-Methods-for-Capturing-Useful-Debug-Informationhttps://help.ui.com/hc/en-us/articles/227129127-UniFi-Methods-for-Capturing-Useful-Debug-Information)

   [how to troubleshoot DHCP timeout/failure](https://community.ui.com/questions/how-to-troubleshoot-DHCP-timeout-failure/bda95a1c-5030-4f02-8d0d-19961a306a6d)

   [Association-Failures-WPA-Authentication-Timeout-Failure](https://community.ui.com/questions/Association-Failures-WPA-Authentication-Timeout-Failure/6cfb5f77-f0db-4c4a-a500-934545803ceb?page=3)

9. Link

   [对 DHCP 客户机配置问题进行故障排除 -Oracle docs](https://docs.oracle.com/cd/E24847_01/html/819-7058/dhcp-trouble-5.html)

   [Windows Server DHCP Docs](https://docs.microsoft.com/zh-cn/windows-server/networking/technologies/dhcp/dhcp-top)


