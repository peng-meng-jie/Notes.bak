#### AD and MSTSC

**概述**

使用现有的基础 AD 域结构、微软的远程桌面服务，构建适用于 LAN 的远程桌面服务。

IT 人员不需要一定到达现成也可以处理一部份的故障和异常。基于原有的架构和技术启用远程管理计算机设备，无需承担额外的费用负担，提高执行的效率。



##### 1. 基础

涉及：AD、GPO、MSTSC、Network；

从应用的方面而言此处不追究深度的知识。

我的假设远程连接流程：

AD_Network（GPO、User）【Windows（server） - RDP - ( Defender - Network - Defender )- RDP - Windows（client）】;

启用远程的基础：访问权限，即用户凭证、网络通道；基于微软的服务再往上一级 AD+GPO 管理；

可能会涉及的相关知识：

> 1. Windows 用户与用户组
> 2. Windows 防火墙
> 3. AD 域
> 4. 域 GPO 管理
> 5. 非官方的技术，比如 RDP 并发
> 6. Windows Commands
> 7. VPN
> 8. 客户端



##### 2. 应用

注意；1. 以下使用知识点划分，并非以步骤为基础；2.  以 LAN 局域网应用为基础；

###### 2.1 GPO （后台管理）

> 1. [远程配置](https://docs.microsoft.com/zh-cn/windows/security/threat-protection/security-policy-settings/allow-log-on-locally)
> 2. [防火墙](https://getadmx.com/?Category=Windows_10_2016&Policy=Microsoft.Policies.WindowsFirewall::WF_RemoteDesktop_Name_1&Language=zh-cn)
> 3. 把目标用户加入：Remote Desktop Users

###### 2.2 MSTSC command start（客户端使用）

> mstsc /v:hosts ，或者 Windows + R，或者 Win + S，以及 RDP 文件；
>
> [mstsc - microsfot command](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mstsc)

###### 2.3 RDP 并发（即多人同步远程连接）

> [rdpwrap - github](https://github.com/stascorp/rdpwrap)

###### 2.4 简单描述（可忽略）

使用 AD 管理 GPO 策略，更改对应的用户凭证、网络凭证，开始投入使用。



##### 3. 扩展

###### 3.1 移动端

Android 远程：SSLVPN（或者其他 VPN）+Remote

Note：当然 macOS、Linux GUI 也支持连接微软的远程连接服务；

###### 3.2 安全

为了安全起见，可以在用户组、防火墙、AD 域管理中加入相关的安全性设置，以提高安全性。

Note：权力是一把双刃剑。

###### 3.3 第三方服务

TeamsView（支持局域网连接，但逐渐凭证化）；

AnyDesk；

VPN;



##### Appendix

Reference

1. [mstsc - microsfot command](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mstsc)
2. [mstsc apply - blog](https://fanzheng.org/archives/16)
3. [rdpwrap - github](https://github.com/stascorp/rdpwrap)
4. [Microsoft Remote Desktop from Android](https://play.google.com/store/apps/details?id=com.microsoft.rdc.android)
5. [Windows AD：Ues GPO and Scripts - blog](https://www.cnblogs.com/airoot/p/8283287.html)

