### 2020 Feasibility Analysis Report 

2020 年可能性分析报告



##### **Report** （ 简 ）

> 时间区间 2020.7 ~ 2020.12

总共数量 93 ，已处理 67 件， 26 件待处理或取消

> 完成度 73 % ，延迟处理  11 %

发现缺点、突发灵感，然后利用现代化的信息技术加快其的发展，应用计算机科学来解决这些问题。

虽然很想说点什么，但是结果而言，满意了。从自己的观察到分析、假设与实验、估计可以应用的程度，整个过程而言虽不是面面俱到，但是能够发现新的计算机科学应用就是一种乐趣，“折腾的乐趣”。

> 立个牌坊，2021 年完成程度 80 + %，同时把 2020 的坑补完 ！

运维，确实很像一个应用计算机科学的人。



### Appendix 1. Feasibility Analysis | 可能性分析

TAG

> -F [失败 // Failure]
>
> -S [成功 // Success]
>
> -P [待定 // Pending]
>
> -C [关闭 // Close]
>
> -A [遗弃 // Abandon]  
>
> -M [ 合并 //  Merge ] 

[TOC]

#### 2020 December

全部  ：关闭  、未完成 、遗弃 、有效 、失败

##### 18. Auto LogOff Users of Windows 	-static	-S -C

自动注销没有没有在使用的电脑的用户。

```powershell
@echo off
@echo "关闭停用用户"
for /f "tokens=1-7 delims=,: " %%a in ('query user ^| find /i "disc"') do logoff %%b
```

##### 17. DevOps And Automation	-static	-P

> “运维”与信息技术自动化



##### 16. Rebuild Notes.bak	-static	-P -S -C

> 基于自己的职业和发展，打碎重建一个信息化服务的笔记系统。
>
> 主题：信息化服务管理与应用

已完成改造



##### 15. ”321“ Data Storage Framework	-static	-S -C

中小企业的数据存储方案 ，“321 存储架构”

321 即：3 三份数据（存储）、2 两个地区（容灾）、1 一份数据（一致性）

>当下类似的 321 方案：Server（中心）、NAS（中心）、NAS（异地）



##### 14. Microsoft Office Files Backup	-static	-P -A -C

虽然 Microsoft Windows Server 本身就有这个服务，容量是个钱。

低容量，高容灾。用 Windows Batch or PowerShell 来实现吧 ！

微软已经想好了，如下。（关闭本条目）

> [在 Word 中使用版本控制。 - Microsoft Docs](https://support.microsoft.com/zh-cn/office/%E5%9C%A8-word-%E4%B8%AD%E4%BD%BF%E7%94%A8%E7%89%88%E6%9C%AC%E6%8E%A7%E5%88%B6%E3%80%82-46b4d23f-b032-4837-94ab-746de8fbe6ec)
>
> [Windows 中的文件历史记录](https://support.microsoft.com/zh-cn/windows/windows-%E4%B8%AD%E7%9A%84%E6%96%87%E4%BB%B6%E5%8E%86%E5%8F%B2%E8%AE%B0%E5%BD%95-5de0e203-ebae-05ab-db85-d5aa0a199255)



##### 13. Microsoft Office Outline Model And ”Mind Map“	-static 	-P -S -

> 使用 Microsoft Office  产品的大纲模式与思维导图

PowerPoint 大纲模式就能够与普通的思维导图的软件不分上下，对于残缺的 Mind 软件还不如不去使用它，况且 PowerPoint 有着更好的演讲性和培训作用。

> 或许专业的 Mind 软件能够符合更多的需求，但是投入商用的基础资金并不便宜。还不如用好当下的工具，创造更多的价值。这是一个不错的选择之一。

**Plan 1**，Microsoft 365 PowerPoint 与培训

培训的用途：录制、笔记、演讲

基础设备：可触控面板、或者屏幕

**Plan 2**，Mind in Microsoft Office

是情况而定



##### 12. 网络资源节流 QoS 	-static	-P 

> 1. 减低负载、2.提高速度 to 2021



##### 11. 自动格式化与正则表达式 	-static	-P -S -C

> Python：pip、csv、re、excel
>
> 协助 Excel 文件的数据统计方法
>
> 问题



##### 10. Requests Web Data Fomat	-static	-P -A -C

> 动态网页，乱码太多，调试失败；



##### 9. Linux shell manage nas	-static	-P -a

> 回炉重造 ，base Linux Knowledge

##### 8. Powershell 收集用户文件信息	-static	-P -S -C

使用管理员账号，执行代码

```powershell
-static powershell 5.0
((Get-ChildItem -Path (Get-ChildItem -Path 'C:\Users\' | Where-Object {$_.Name -notlike ".*"}).FullName | Where-Object {$_.Name -notlike ".*"} ).FullName | Get-ChildItem -Depth 1).FullName
-static powershell 2.0
((Get-ChildItem -Path (Get-ChildItem -Path 'C:\Users\' | Where-Object {$_.Name -notlike ".*"}).FullName | Where-Object {$_.Name -notlike ".*"} ) | Get-ChildItem)
```



##### 7. Microsoft Power Automatic	-static	-P -A -C

居然收费、需要管理权限，恰好都没有！Pass



##### 6. 企业网络服务架构与耦合性	-static	-P -S -C

针对个人主要：计算机基础、信息化服务、自动化；

追对企业：计算机基础、信息化服务、维护与管理、安全防护；



##### 5. VLAN 、NAT 网络配置	-static	-P

> to 2021

##### 4. 彩蛋设计	-static	-P

> 没空



##### 3. 限制用户登录数量	-static	-P -A -C

性能不足，限制“自由的用户”

> 曲线救国 ！自动注销用户。



##### 2. 企业信息化作业培训计划	-static	-P

> to 2021

##### 1. 远程共享画面或同屏操作	-static	-P a

> 共享协助，可以去了解各种远程软件服务



#### 2020 November

全部  ：关闭  、未完成 、遗弃 、有效 、失败



##### 8. 回到老项目	-static	-P -S -C

> 1. 虚拟化
> 2. Linux Get-help
> 3. AP rout Get-help



##### 7. Find Meeting Server	-static	-P

> to 2021

主旨：与 Umeet 相似就好，用于备用

功能需求：1.UI 与 操作方式；2.会议通讯支持；3.国际化；

思路

> 1. 优先考虑国际化平台
> 2. 全球各地服务器同步，即网络通讯
> 3. 用户操作与产品设计

主要测试

> 1. 网络的可访问性与同步，比如：语音、投屏
> 2. 全球化
> 3. 功能设计，基本操作



##### 6. 每日温馨提示	-static	-P -S -P

> to 2021

数据源

> Get-Help (Get-Command | Get-Random) -Full

```python
p = subprocess.Popen(["powershell.exe",
            "-command",
            "Get-Help (Get-Command | Get-Random) -Full"], 
            stdout=sys.stdout)
        p.communicate()
```

目的 : 使用 Python 定时收集和发送信息到个人邮件

Note

此部分可作为服务库的一部份作为开发点



##### 5. Windows Files And ALC Management	-static	-P -A -P -S -P -S -C

文件管理

对于单纯的文件管理 : 基于组和用户，以及文件夹管理即可，GUI 管理并不复杂.

ALC 管理

可以使用 GUI 或者 CLI 进行管理

鉴于 mstsc 连接不是在某些方面不是很好用, PowerShell 是否支持或代替 GUI 操作吗?

> 我目前人为, 它在一些简单\负责的处理有很有效. 然后开始实践
>
> 对于一些复杂的项目, 或许 GUI 也有它的优势所在. 



##### 4. PowerShell Conut/Size：Folder And Files 	-static	-A -C

powershell/module/

> Get-ChildItem
>
> Select-Object
>
> Measure-Object

Note：

和之前的方法是同一个，它有些性能不足，不如手动的快。

> 注：只是针对目前版本而言，没研究过底层代码，未知其的”工作模式“
>
> PowerShell 5.0

评估结果：不适用！	

-staticTAG.pass



##### 3. 电脑支援”扩音器模式“	-static	-P A 

需求：利用麦克风和扬声器，变成”扩音器“。

> 搞个麦克风就好了 ！软件支持



##### 2. 使用脚本进行信息收集与分析（Python）	-static	-P

需求：开发适用当前的运维应用环境的“ Python 方法库 ”

比如：网络状态、服务器状态、网络服务状态等待监控平台。

> 为了避免重复造轮子，本次代码以能使用、可维护作为其中的设计方法之一。



##### 1. Python Scripts And AutoRun	-static	-P -S -C

主机适用范围：可以自主管理的 Windows、Linux 主机；

应用范围：故障分析与修复、自动化处理、信息收集与分析；

第一个应用测试：Python 与信息收集、分析；



#### 2020 October

全部  ：已完成 4、未完成 5、遗弃 8、失败 N、关闭 13

> modified date：2020.11.02、11.03、



##### 17. “ VBS 脚本”发送键盘方法（不创建文档）	-static	-P -S -A -C 

注：该功能由微软的 VBS 脚本提供，暂不调查其脚本的生命周期，它在 Windows 7、10 是工作的。

```vbscript
@REM "AutoEnter<Win>Kyes" -static VBS 脚本
Set WshShell = CreateObject("Wscript.Shell")
WshShell.SendKeys "^{esc}" -static 注：键盘上的 Windows 键
Wscript.Quit 
```

> [SendKeys Method - Microsoft vbs docs](https://docs.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/windows-scripting/8c6yea83(v=vs.84)?redirectedfrom=MSDN)



##### 16. 维护半自动化备份脚本（ PowerShell ）Only Docs	-static	-P -S -C

> 1. 熟悉 powershell  的基础语法
> 2. 了解 Windows 系统版本环境和 Windows Batch command
> 3. 目前辅助的脚本设计思路



##### 15. PowerShell 与文件过滤	-static	-P -A -P  -S -C

过滤不必要的信息或文件，只选取目前需要使用的文件，进行下一步处理。

Powershell Module

> Compare-Object
>
> Write-Host
>
> Read-Host 
>
> Get-ChildItem
>
> Where-Object
>
> Invoke-Item 

实践

> PD-ID 进行中	-static	TAG-Pending
>
> QC-ID 失败，内容有效、但是文件不对头，但不符合相关的需求	-static	TAG-Pass
>
> 1. 或者逆向操作，但太差了，不能得到有效的运行



##### 14. MyBlog.bak Restrat Projects	-static	-P

Main

> python、powershell、markdown、OneDrive、GitHub、pip:Pelican

Web

> GitHub page 、docker





##### 13. PowerShell Remoting Manage	-static	-S -A -C

假设基于界面进行管控，不停的切换窗口，还要顾虑软件画面存在的”缺陷“。

Powershell CLI 远程管理，为此而生。

注：Windows 服务器默认开启 powershell remote

> [running-remote-commands - powershell docs](https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/running-remote-commands)



##### 12. 故障分析	-static	-P -S -C

一个案件的产生什么周期

> 1. 案件建立
> 2. 用户需求
> 3. 故障分析 -static
> 4. 处理方式
> 5. 结案

统计下来，再分析，再改进。

> 1. 故障率
> 2. 可改进
> 3. 可优化



##### 11. Web 的压力测试	-static	-P

客户端并发、网络通道管理、数据统计、性能扩展；



##### 10. 脚本设定默认的程序（注册表）	-static	-P -S -A -C

需求：修复无法更改指定文件绑定相关程序；自动绑定相关的程序；

实现方式：

> 1. Windows GUI 注册表备份与还原
> 2. Windows CLI 管理（cmd or powershell）
> 3. 脚本自定义：batch or powershell

预计成本

> 1. 注册表备份与还原
>
>    当下的最优解，完整的 GUI 操作，OK
>
>    > 1. 使用当前用户设定，“进行注册表”模板设定，备份
>    > 2. 然后在第二台设备部署即可
>    > 3. 二次修改利用
>    > 4. 修改内容相关的参数：文件格式、程序路径 （注意命名规则）
>    > 5. 部署
>
> 2. Windows CLI 管理（cmd or powershell）
>
>    - [x] Pass
>
>    需要对管理者及其熟悉 Windows 注册表
>
> 3. 脚本自定义：batch or powershell
>
>    - [x] Pass
>
>    自动化最优解，但是没时间测试和实验.

Note：暂无时间测试，不设立文档，只做评估。

Reference

> [备份和还原注册表](https://support.microsoft.com/zh-cn/help/322756/how-to-back-up-and-restore-the-registry-in-windows)
>
> PowerShelll 管理
>
> >  [使用注册表项](https://docs.microsoft.com/zh-cn/powershell/scripting/samples/working-with-registry-keys?view=powershell-7-staticcreating-keys) 、[使用注册表目录](https://docs.microsoft.com/zh-cn/powershell/scripting/samples/working-with-registry-entries?view=powershell-7)
>
> [ChangeDefaultProgramsInWin10 - github](https://github.com/shan165310175/ChangeDefaultProgramsInWin10)



##### 9. Portable Programs 部署与迁移	-static	-P -S -C

便携程序来源：1. 自制；2. 第三方提供；

数据包

> 基于树结构，然后制作一个快捷方式的文件夹，将其内容复制到相关的用户程序启动参数或文件夹即可；

部署：1.  个人；2. 系统；

> - 路径
>
> 个人：%localappdata%\DATA\Portable
>
> 系统：%SystemDrive%\Portable
>
> - Program 菜单
>
> 个人：%appdata%\Microsoft\Windows\Start Menu\Programs
>
> 系统：%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp

实现

> 1. 数据包
>
>    7zip、或者单一的文件夹；
>
> 2. PowerShell、Batch
>
>    element：复制、覆盖、创建；

Reference

> 1. [Windows 自启设定 - blog](https://huchengv5.github.io/post/%E5%A6%82%E4%BD%95%E6%B7%BB%E5%8A%A0%E5%88%B0%E5%BC%80%E6%9C%BA%E8%87%AA%E5%90%AF%E5%8A%A8.html)



##### 8. Microsoft Github Projects For Windows	-static	-P

> to 2021

涉及项目乳如下：

> 1. 启动器
> 2. 预览器
> 3. 窗口管理

Reference

> 1. [PowerToys](https://github.com/microsoft/PowerToys)



##### 7. 信息收集与过滤	-static	-P -A -S

目前的假设

> 1. 随从记录信息，发送、发送、发送，服务器收集信息然后定时推送信息至使用者邮箱。
>
>    记录你的灵感，更方便。
>
> 2. 随机发布信息，信息化系统自动汇集统计信息。
>
>    相似于 Microsoft Teams 一样，没有阅读到的信息，汇集至后台然后推送到个人的 outlook 。
>
> 3. Note
> 
>    这种信息化思维和 ERP 的信息化基本相似，汇集多方信息，自动分类和统计，代理人只需要关注关键的信息即可。
>

可以自主实现吗？可以，就是成本有点高。

> 1. 前端浏览器，用于处理兼容性
>
> 2. 后端后台数据存储与分析

或许有更好的方案？架设基于现有的方案：Microsoft Todo

> 通过共享 Todo 列表，使用分帐号直接汇总至一个主账号，人工统计信息。

其他软件

> 付费服务可获得更好的服务：印象笔记、或者它的笔记类软件。



##### 6. 在Excel 中使用正则表达式（User Docs）	-static	-P -A -C

> Ctrl + H 、VBA 函数中使用通配符或者正则表达式；



##### 5. batch or powershell 管理 Windows 凭证	-static	-P -P -S -C

> 1.  - [x] 自动备份 
> 2.  - [ ] ~~公共电脑凭证管理~~
> 3.  - [x] 清除用户凭证
>
> [cmdkey -- Microsoft Docs](https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/cmdkey)

Notes：不编辑相关的文档



##### 4. PowerShell 自动截图	-static	-P -A -C 

> 需要用到 .net code ，开发和测试成本高，遗弃该条目；
>
> 个人更偏向于现有的 powershell 或者 python 脚本式处理，而不是一门编程语言；
>
> 或者 Powershell 直接输出检查内容是一个不错的意外发现；



##### 3. Dahua DVR LAN 与 IT 机房（docs）	-static	-P -A -C

SSLVPN 或局域网远程观察机房情况；

> https://192.168.33.77	//	it	//	phd.it.fab	//	通道：IT 机房；



##### 2. Mouse Without Borders（docs）	-static	-P -S -C

无界鼠标，可跨越或管理四台 Windows 设备，兼具主机和屏幕的控制，由微软开发。

适用于：单桌面，多主机（比如笔记本和主机），使用单套鼠标键盘即可操作，做高支持四台主机；

> [Mouse Without Borders](https://answers.microsoft.com/en-us/windows/forum/windows_10-start/mouse-without-borders-mousewithoutborders/0523308d-3406-4273-b86e-bef28aa6b50d?auth=1)



##### 1. Windows 硬件测试与核对	-static	-P -A -C

可能包含主机、笔记本、平板，以笔记本为例；

机器本身：外观、屏幕、键盘、材料。

工具第三方软件：CPU-Z、SSD；

涉及部分如：CPU、内存、GPU、存储、系统、WIFI、蓝牙、GPS 等等；

Note：不创建说明文档，遗弃；



#### 2020 September

全部 19 ：已完成 6、未完成 4、遗弃 、失败 9、关闭 

> modified date：2020.11.02



##### 19. 计算机服务监控（无人值守）	-static	-P -P -M -C

基于 Poweshell、python，自动检查计算机服务；

> 合并至其他条目



##### 18. Windows LAN network sync	-static	-P -A -C

非 VPN 的情况下，移动设备连接到局域网后自动开始同步数据；

使用第三方软件，或者微软自带文件备份，或者 NAS 服务；

> 1. Control Panel\System and Security\File History\Select Drive\ <Network-Path>
> 2. 第三方服务，比如 NAS 主机服务；
>
> Note：所以最终还是回归到手动备份，或者半自动运行服务；



##### 17. Windows process manage	-static	-P -F -C

需求：自动关闭注销用户、锁屏用户的 Outlook client Exchange Server 同步；即自动关闭程序；

目前 GPO 支持开关机、用户登录时运行脚本，却没关于锁屏后自动运行脚本命令；



##### 16. AD And MSTSC（AD 域与远程连接服务）	-static	-P -S -C

> mstsc： Microsoft terminal services client
>
> 需求：适用于局域网的远程连接，旨在特殊需求的连接与管理；
>
> Note：会有安全性的问题，请留意！



##### 15. Windows CLI and Service	-static	-P -P -M -C

> 合并至其他条目

基于 Windows、CLI、系统特性等基础，集成一个 CLI 程序，通过 AD 部署 CLI Service；

在此的基础上，可能会增加一键检查网络、凭证管理、清除缓存、收集客户端信息等等；

> 1. GitHub 没有现成的方案、或者还没找到；

注意：不知道是否会继承 Administrator 群组的权限；

15.1 CLI Program

成本过高，先待定处理；

> [Build a Command Line Interface (CLI) Program with .NET Core](https://medium.com/swlh/build-a-command-line-interface-cli-program-with-net-core-428c4c85221)
>
> [Windows process Service 制作与调试](https://huchengv5.gitee.io//post/Windows%E5%90%8E%E5%8F%B0%E6%9C%8D%E5%8A%A1%E8%B0%83%E8%AF%95%E4%B8%8E%E5%AE%89%E8%A3%85.html)

15.2 AD + Service

>  基础环境：AD + GPO + CLI or Service；不在此记录和测试；

15.3 假设

应用层面

> 1. 基于 AD 后台发布 Windows Service；
>
> 2. 客户端基于 Service 执行一些适用于 IT 管理员的操作；
>
> 3. 用于无需提升 AD 权限就可以处理一些人为的故障；
>
> 4. IT 管理员基于此服务制作一些 batch 脚本，用户无需关注 IT 的知识，运行脚本获得结果;
>
>    > 在此的基础上，可能会增加一键检查网络、凭证管理、清除缓存、收集客户端信息等等；
>    >
>
> 5. 有助于，提升工作的效率。



##### 14. 虚拟化主机、容器与服务	-static	-A -C

> 可行性分析，基于主机的服务
>
> 1. VMware vSphere 基础硬件资源要求太高，不切实际（不能进行实验），Pass；
> 2. Docker + k8s ，基础周期长收益低，与当前的实际应用有区别，一个“主机级别的服务”，一个是“容器化技术”。
>
> 可行性分析，基于容器的服务器（方向确认）
>
> 1. 继续使用 Docker ，目前应用方面为 Web、File Server（FTP、Samba）；
> 2. 暂不涉及 k8s 的学习与应用，就像是“大材小用”可惜，不如见好就收适合当前的服务和应用；



##### 13. 虚拟网卡	-static	-P -F -C 

> Microsoft Loopback Adapter

对于虚拟网卡通常和虚拟服务架构搭载在一起，在应用阶段就不适合多做开发需求的事情，把重点放在其他方面会更好，比如 DNS、虚拟化网络管理、网络管理，会更好一些。



##### 12. Windows Search（Docs）	-static	-P -A -C

> 自带：Windows Search、GitHub
>
> 第三方软件：Everything
>
> command：Powershell、cmd batch

偏向文档类型的操作方法，可细化到文件的内置标签，没时间处理选择遗弃。



##### 11. Windows Flies Server Logs（Event）Manage	-static	-P -A -C

> 1. 架设 Event 日志收集服务器，配置好客户端与服务器中转或直连、计算基本的计算机资源需求；
>
> 2. 配置 GPO 开启相关的文件服务器的审阅，记录相关信息；
>
> 3. 后期排查异常事件，或追踪文件操作；
>
> Note：资源需求高、不太符合当前的系统架构；



##### 10. PowerShell Manage UWP（Docs）	-static	-P -A -C

> 1. PowerShell Command： get-appxpackage、remove-appxpackage；
> 2. GUI Tools： Geek Uninstall Program;
> 3. Package ： https://store.rg-adguard.net/
> 4. Windows 10 LTSC install Microsoft Store ：https://github.com/kkkgo/LTSC-Add-MicrosoftStore
>
> Note：针对系统级别的 UWP 程序；200925-不打算增加相关文档的操作和编写；



##### 9. 容器虚拟化应用 Docker	-static	-P

> to 2021

目前的计算机性能逐渐提升，为了更好的利用计算机资源，使用虚拟化技术的应用以发挥更好资源优势；

> 1. Web 站点虚拟化，而不是主机化（资源管理、资费方面更具优势）；
> 2. 文件服务器虚拟化（如 FTP、IT Samba）；



##### 8. 排查“共享文件问题”（Docs）	-static	-P -S -C

“幽灵事件”：该文件正在被打开或修改提示我正在使用中，但我却没有打开该文件！

> 1. 登录文件服务器；
> 2. 计算机管理-系统工具-共享文件夹
>    - 共享（已分享资源）
>    - 会话（正在登录中的用户）
>    - 打开的文件（正在使用中的资源）*
>
> Note：写一份问题追踪记录与解决方案



##### 7. 企业资源计划 ERP（ Easy Flow ）	-static	-P -P

> - 基本概念和知识；
> - ERP 管理与应用；
>
> [ERP](https://zh.wikipedia.org/wiki/%E4%BC%81%E4%B8%9A%E8%B5%84%E6%BA%90%E8%AE%A1%E5%88%92)



##### 6. Excel 共享工作薄	-static	-P -A -C

注意：只能记录当前修改者和前一位修改者。

好像之前已应用过该功能，貌似不太适合当前的场景（更具优势的功能已被 Microsoft 365 所代 --“贵”）

> [启用“共享工作簿”功能 -- Microsoft Docs](https://support.microsoft.com/zh-cn/office/%E5%85%B3%E4%BA%8E-%E5%85%B1%E4%BA%AB%E5%B7%A5%E4%BD%9C%E7%B0%BF-%E5%8A%9F%E8%83%BD-49b833c0-873b-48d8-8bf2-c1c59a628534)



##### 5. 无人值守流量监控	-static	-P

> 基础设备与平台：Unifi Control and more、宽带、应用服务（exchange、easy flow、file server and more）；



##### 4. Windows Sysinternals	-static	-P -A - C

统计可适用于协助运维的工具（即有助于分析、管理、统计等工作）；

> [Sysinternals -- Microsoft Docs](https://docs.microsoft.com/en-us/sysinternals/)



##### 3. 修复异常的 Windows 系统	-static	-P -S -C

>1. 系统重装：耗时长、彻底覆盖、需重新配置（包括系统的授权）；
>2. 系统重置：耗时长、根据系统原有文件进行修复（不彻底）、需重新配置（软件）；
>3. 系统修复：耗时长、利用外部或 Windows 更新文件修复系统（彻底更换）、无需配置；
>
>解决方案顺序建议：修复 - 重置 - 重装
>



##### 2. 更为快速的 Remote Server Manage 以及 SSH	-static	-S -C

> RSAT 允许 IT 管理员从 Windows 10 PC 管理 Windows Server 角色和功能。

可用于远程管理 AD 域内的服务器，而无需直接远程连接，即可处理大部分的服务器任务；

其实还有 PowerShell and SSH，门槛有点高，已经很接近 “Linux 集群管理”的特定和优势；

[远程服务器管理工具](https://docs.microsoft.com/zh-cn/windows-server/remote/remote-server-administration-toot)



##### 1. Windows Pro 升级为 Windows Service ？	-static	-F -C

> 引用：RSAT 允许 IT 管理员从 Windows 10 PC 管理 Windows Server 角色和功能。
>
> Link ：[远程服务器管理工具](https://docs.microsoft.com/zh-cn/windows-server/remote/remote-server-administration-tools)
>
> Note：微软拒绝被“白嫖”



#### 2020 August

全部  17：已完成 5、未完成 6、遗弃 、失败 、关闭 

> modified date：None



##### 17. Text Edit PDF	-static	-F -C

> 支持记事本编辑？不建议，其数据结构不可读（二进制、布尔值、图形压缩），工具给予人类更方便地处理事物，不是让最终的用户去开发工具。
>
> [可移植文档格式](https://zh.wikipedia.org/wiki/可移植文档格式)



##### 16. 内网穿透	-static	-P -P -A -C

需解决问题：1.直连指定境外网站（医药网站）；2.穿透防火墙（赋码系统）；

测试方案 1：中转网络，ShadowSocks 转向 V2ray、附加 Route 配制限定网站 + 附加加密。

> 基础环境，防火墙（外网权限绑定 MAC）、网络代理（基于本地应用层端口）、网卡；
>
> 1. “虚拟机”失败；
> 2. 本地端口服务失败，不继承网络代理浏览，且受到防火墙管控；
>
> Failure

测试方案 2：虚拟 VPN（LAN）；

> 直接忽略，可行不可靠；
>
> Failure

测试方案 3：网络负载均衡（双网卡）；

> 开启均衡后，再启动网络代理；
>
> [Network-Manager -- SortByte](https://github.com/SortByte/Network-Manager)
>
> [network-load-balancing -- Microsoft Docs](https://docs.microsoft.com/zh-cn/windows-server/networking/technologies/network-load-balancing)

Note：1.防火墙；2.网络穿透（基于软件，测试目前环境不适用于  Project V）；



##### 15. 提问的智慧	-static	-P -S -C

> [How-To-Ask-Questions-The-Smart-Way](https://github.com/ryanhanwu/How-To-Ask-Questions-The-Smart-Way)



##### 14. 用户手册，outlook 规则使用建议	-static	-P -A -C

> 一条规则即可：切勿自相矛盾；
>
> 流程和操作，查阅 [Office Outlook 技术支持](https://support.microsoft.com/zh-cn/outlook)



##### 13. Route AP 网络配置与分析	-static	-P 

> to 2020

> 1. 收集与分析信息；
> 2. 应用解决方案；
> 3. 完成相关文档；



##### 12. Windows  与 office 产品性能评估与优化	-static	-P  -S -C

旨在优化旧设备对 Windows 产品的运行优化方案（适用于 Windows 7）；

并额外关注监控主机客户端需求，网络、视频硬解、视频软解、客户端平台；

> https://dahuawiki.com





##### 11. Windows Service Develop	-static	-P -F -A -C

旨在于基于 Windows 服务与系统嵌套集成，提供相关的服务和方案；

> 之一部分因该由 Microsoft 提供，而不是由使用者来开发和实现众多的服务和功能；
>
> 详细信息咨询微软或者查阅微软的技术文档；



##### 10.开发和应用「适用于用户操作的故障解决方案」-static	-P -M 

> to 2021

假设：AD＋GPO＋FS 推送应用解决方案；

> 1. 快捷方式：简单来说就是，同步一个快捷方式（连接至服务器、FS）到用户端
>
> 2. 管理服务器
>
>    >用户：技术文档、用户解决方案、使用建议手册、安全宣传；
>    >
>    >管理员：权限、分发、推广；
>    >
>    >技术支持：AD、GPO、FS、容灾、安
>
> 3. 后期维护
>
> 4. 其他想法
>
>    > 推送公共（基于 VB 实现）、URL or Microsoft link；

可能性分析



##### 9. Windows 非域域环境工作站与自动化	-static	-P -S -C

基于 Windows ：LGPO、Startup、Task、Public-Profile 与 Batch 、PowerShell；



##### 8. 本地全局注册表全同步	-static	-F -C

非GPO部署环境下的代替方案（其实GPO可以做到更好，比如本地同步、服务端强制同步）；

>HKEY_CURRENT_USER	存储当前用户设置的信息,对其他的登录用户无效；知识有限无法自创建自动注册表化；
>[注册表](https://zh.wikipedia.org/zh-hans/%E6%B3%A8%E5%86%8C%E8%A1%A8)



##### 7. OFFICE 模板	-static	-P -A -C

微软有开发此功能，但是却对个人用户不是很友好，对企业用户的是的支持还有的。不过此类方案更为明显的地方在 Microsoft 365 的产品中。 

1. 后台推送，与自定义有些冲突，配合 GPO 强制推送，适合于强制性的范围和业务；

2. 文件服务器，由使用者放置和安排统一规格；
3. 或许 Microsoft 365 才是真香；

> Microsoft Docs
>
> 1. [更改 Normal 模板 (Normal.dotm)](https://support.microsoft.com/zh-cn/office/%E6%9B%B4%E6%94%B9-normal-%E6%A8%A1%E6%9D%BF-normal-dotm-06de294b-d216-47f6-ab77-ccb5166f98ea)
> 2. [编辑模板](https://support.microsoft.com/zh-cn/office/%E7%BC%96%E8%BE%91%E6%A8%A1%E6%9D%BF-b2cb7adb-aec2-429f-81fd-3d5bd33cf264)



##### 6. Microsoft Link、powershell、batch、系统变量与快捷处理 -static	-P -A -C

目前 batch 和 powershell 可以相互嵌套，配合 Windows 系统环境如下：

> Windows 环境变量与 Batch、powershell
>
> 1. 用户环境变量，独立于系统，个性化（或独立性）设定；系统环境变量，全局变量；
> 2. 存储结构：变量-值（换一种说法：程序别名-程序路径），以此为例：变量：ps、值：%powershell%
> 3. 访问：1.cmd：ps、2.powershell：ps、3.Win+R：%ps%（可以是文件夹）或者 ps；
> 4. PS：也可以在脚本中嵌套；
>
> Windows ink 与 powershell、batch、系统变量
>
> 也可以模拟命令行，和传输参数，二次需要第三方工具；
>
> Note：类似于 Linux 的硬链接、软连接的属性，操作和管理方面存在一些差异。
>
> ​			不详细记录和描述操作的步骤；



##### 5. CLI 与键盘快捷键	-static	-F -C

已确认当下 Microsoft Windows Xp~10（2004）Bacth Command（.bat）没有支持操作键盘（或快捷键）的API接口；



##### 4. Windows Bacth 脚本检查当前用户登录状态	-static	-F -C

预计计划可行，但由于cmd不支持命令结果传递(示例如下)部分不支持（后面无法判断数据），故本计划取消；

>SET command=quser
>%command%-static结果就是 quser，而不是所返回的用户登录信息；
Note：额外获得信息，cmd 或powershel l支持“正则表达式”，或许 powershell 可以做到但没有实际的应用环境；



##### 3.Microsoft 激活密匙备份与还原	-static	-S -C

有相关的方案和执行规范，但是否能长有效还没有定数；
注意：仅针对正版授权的主机终端，根据发行版而差异；



##### 2. 鼠标右键与注册表	-static	-P -S -C

对于目前的 Microsoft 发行版可行，稍后处理；

已建立相关文档，但应用方面局限性大，不宜推广和应用，适用于个别的需求；



##### 1. Microsoft Office Troubleshoot	-static	-P -S -C

可行，基本等同于 Microsoft Office 产品的问题解决方案的信息库；
往后在补充相关信息、给予了我一些用户操作说明和指导说明的编写灵感；





#### 2020 July

-F [Failure] -S [Success] -P [Pending] -C [Close] -A [Abandon]

全部 13 ：已完成 6、未完成 2、遗弃 4、失败 4

> modified date：None



##### 1. ”LAB-LDAP“ 安全性	-static	-P -S -A

基于AD域和GPO进行数据、存储安全性保护；

> 后期已经通过不同的方式来实现，比如 GPG、安全软件等等。



##### 2. Windows software - data backup	-static	-F -C

系统备份比较健全，应用的数据备份却因软件而言“差异性蛮大的”
outlook客户端支持一些做法，存在一些问题和局限性；
其他软件也是根据软件自身的情况而决定，目前所观察的情况而言“大家似乎不是很想让别人备份或突破安全性的问题”；



##### 3. Windows 自动化凭证管理与安全	-static	-C -F -A

由于目前的Windows系统安装设计，无法操作直接API来创建和管理凭证，但可以查看加密后的状态。另外可以使用其他的特殊途径实现，已脱离了本身的需求故不再做跟进；
补充：（Powershell）SSH协议则不受此限制；

##### 4. IE clear cache for Windows batch or powershell	-static	-P -A

> Batch 更好用，也有现成的方法。



##### 5. 系统滚动升级	-static	-C -P -A

据目前的资料所得知，目前没有支持Windows安全和补丁更新的滚动升级，只有关于服务器集成的系统跨版本升级。目前的做法可能还不支持AB分区切换的滚动升级（新版安卓10已实现）。不过“异步升级”才是可靠目前的可靠方法（各方面“资源”损耗相对较高）。
Attachment Link: [WindowsServerUpdate](https://docs.microsoft.com/zh-cn/windows-server/failover-clustering/cluster-operating-system-rolling-upgrade)、[WindowsServer2016Hyper-V(2012to2016)](http://365vcloud.net/2016/11/08/upgrade-2012-r2-cluster-to-2016-using-cluster-os-rolling-upgrade/)



##### 6. 基于 PC 的会议语音测试	-static	-P -A -C

单例测试：电子音频存储是一段“波普”，播放发音、再录音就可以做到语音方面的测试；
音频检查、视频检查、网络检查，均可以在软件层面实现和和执行；



##### 7. 网络速度上限测试	-static	-P -S -C

网络性能测试，可基于Iperf、Netperf测试。



##### 8. Windows快捷方式AD测试于迭代推送	-static	-P -A -C

[基于 AD-GPO 推送 Shortcut](https://social.technet.microsoft.com/Forums/zh-CN/d0f9fa97-7ccb-4ebd-ab73-331c75b66d2d/ad3245231574300536530621019243142670038754ie24555254632604124335?forum=winserver8zhcn)



##### 9. FeasiblityAnalysis	-static	-S -C

特指本文；



##### 10. AutoInstallProgram	-static	-F -C

Plan-static1、MicrosoftAD+SCCM(SystemCenterConfigurationManager)，可与MicrosoftServerAD集成；
Plan-static2、第三支持-商业服务，贵，但可行；
Plan-static3、插件、脚本、动力支持，维护成本高；



##### 11. Windows Copy-Profile	-static	-F -C

没有固定API、与局域网用户profile冲突（限制新PC）；



##### 12. LGPO 测试与应用	-static	-S -C

面向单个本地用户进行测试GPO功能和使用限制，还可以应用于公共主机和账号；



##### 13. Powershell Add auto open folder	-static	-S -C

Powrshell command-invoke-item”path“