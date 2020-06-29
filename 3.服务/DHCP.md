# DHCP

> 动态主机设置协议（英语：Dynamic Host Configuration Protocol，缩写：DHCP）是一个用于IP网络的网络协议，位于OSI模型的应用层，使用UDP协议工作，主要有两个用途：
>
> - 用于内部网或网络服务供应商自动 <u>分配IP地址</u> 给用户
> - 用于内部网管理员对所有电脑作中央 <u>管理</u>

### 1. 概念

> 应用：IP 的自动分配与管理
>
> DHCP统一使用两个[IANA](https://zh.wikipedia.org/wiki/IANA)分配的端口作为[BOOTP](https://zh.wikipedia.org/wiki/BOOTP)：[服务器端](https://zh.wikipedia.org/wiki/服务器端)使用67/udp，[客户端](https://zh.wikipedia.org/wiki/客户端)使用68/udp。
>
> DHCP 运行分为四个基本过程 ① 请求IP租约、 ② 提供IP租约、 ③ 选择IP租约、 ④ 确认IP租约

应用方向：集成管理、容灾分配、手动配置 IP、DHCP Config 等等，HDCP 作为计算机资源管理技术的一部分，需要整合其他的“资源”可以更为有效的管理计算机；

### 2. 应用

搭建不同平台的 HDCP 服务器，用于 LAN 的子网划分

#### 2.1 Linux DHCP

> [CONFIGURING A DHCPV4 SERVER  -- RedHat](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/s1-dhcp-configuring-server)
>
> [DHCP_Servver for Debian](https://wiki.debian.org/DHCP_Server)

#### 2.2 Windows DHCP

> New-NetIPAddress -IPAddress 10.0.0.3 -InterfaceAlias "Ethernet" -DefaultGateway 10.0.0.1 -AddressFamily IPv4 -PrefixLength 24
> Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 10.0.0.2
> Rename-Computer -Name DHCP1
> Restart-Computer
>
> Add-Computer CORP
> Restart-Computer
>
> Install-WindowsFeature DHCP -IncludeManagementTools
> netsh dhcp add securitygroups
> Restart-Service dhcpserver
>
> Add-DhcpServerInDC -DnsName DHCP1.corp.contoso.com -IPAddress 10.0.0.3
> Get-DhcpServerInDC
>
> Set-ItemProperty –Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\Roles\12 –Name ConfigurationState –Value 2
>
> Set-DhcpServerv4DnsSetting -ComputerName "DHCP1.corp.contoso.com" -DynamicUpdates "Always" -DeleteDnsRRonLeaseExpiry $True
>
> $Credential = Get-Credential
> Set-DhcpServerDnsCredential -Credential $Credential -ComputerName "DHCP1.corp.contoso.com"
>
> rem At prompt, supply credential in form DOMAIN\user, password
>
> rem Configure scope Corpnet
> Add-DhcpServerv4Scope -name "Corpnet" -StartRange 10.0.0.1 -EndRange 10.0.0.254 -SubnetMask 255.255.255.0 -State Active
> Add-DhcpServerv4ExclusionRange -ScopeID 10.0.0.0 -StartRange 10.0.0.1 -EndRange 10.0.0.15
> Set-DhcpServerv4OptionValue -OptionID 3 -Value 10.0.0.1 -ScopeID 10.0.0.0 -ComputerName DHCP1.corp.contoso.com
> Set-DhcpServerv4OptionValue -DnsDomain corp.contoso.com -DnsServer 10.0.0.2
>
> rem Configure scope Corpnet2
> Add-DhcpServerv4Scope -name "Corpnet2" -StartRange 10.0.1.1 -EndRange 10.0.1.254 -SubnetMask 255.255.255.0 -State Active
> Add-DhcpServerv4ExclusionRange -ScopeID 10.0.1.0 -StartRange 10.0.1.1 -EndRange 10.0.1.15
> Set-DhcpServerv4OptionValue -OptionID 3 -Value 10.0.1.1 -ScopeID 10.0.1.0 -ComputerName DHCP1.corp.contoso.com
>
> [使用 Windows PowerShell 部署 DHCP](https://docs.microsoft.com/zh-cn/windows-server/networking/technologies/dhcp/dhcp-deploy-wps)

### 附录

**Link**

1. [DHCP](https://zh.wikipedia.org/wiki/动态主机设置协议)  -- Wikipedia
2. [DHCP Microsoft Docs](https://docs.microsoft.com/zh-cn/windows-server/networking/technologies/dhcp/dhcp-top)
3. [DHCP for Windows Server](https://www.dhcpserver.de/)
4. [DHCP Server Linux（CentOS）](http://linux.vbird.org/linux_server/0340dhcp.php)
5. [DHCP Server Linux（Debian）](https://wiki.debian.org/DHCP_Server)

**关联**

子网划分/四类 IP 地址划分/LAN/ARP/