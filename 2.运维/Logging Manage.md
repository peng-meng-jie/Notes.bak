### Logging Manage

Logs 支持历史记录追溯、数据统计分析与管理、病毒分析、漏洞分析等等的记录基础信息，在于记录信息的基础上有辅助于其他信息和业务分析、理解和应用。引入统计学，以方便了解和使用数据的统计操作，以及意义和学识的所在，不为只是为了观察表象而描述表象。

> 对服务器日志进行统计分析可以找出有关时间、引荐来源、用户代理等信息的规律和相关性。 Wikipedia # Server Logs

##### 1. Windows Event viewer

却决于 Microsoft 所支持、能自定义、能够操作的应用层界面，使用方式为 Event viewer、PowerShell API。所以呢，这是建立在一封装好的信息中处理数据，关键的信息会受限于 Microsoft 的开发和支持。另外的中间件或软件 logs 工具不在此笔记中记录。

###### 1.1 GUI

Panel - Actions

>  Import、Open、Create、Views、Refresh、Find、Save、Copy、Properties；

Panel - Object 

Custom Views

目前 Windows 支持可选的格式如下：

> 时间、分类、程序或来源、事件 ID、类型、关键字、用户、主机名称；

Windows logs

> 应用、安全、安装、系统、防火墙；

Application and Server logs

> Server、Application（system、other ）

Subscriptions

> 参阅文档 [windows-event-collector](https://docs.microsoft.com/en-us/windows/win32/wec/windows-event-collector)
>
> 启动简单，参数也可以配置。
>
> 备注：另有专业的第三方服务提供商 [kiwi-free-syslog-server](https://www.kiwisyslog.com/free-tools/kiwi-free-syslog-server)

###### 1.2 Microsoft Power Shell

支持查询本地日志和服务器日志，可寻址 ID、类型、指定计算机；配合其他的文本 CLI 程序效果更佳；

> [Get-Eventlog -- Powershell 7.1 ](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-eventlog?view=powershell-5.1&viewFallbackFrom=powershell-7.1#syntax)
>
> [Get-WinEvent -- Powershell 7.1 ](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Diagnostics/Get-WinEvent?view=powershell-7.1)

##### 2. Linux Logging Server

以下为简单配置流程

需求 Null

1.基础环境：”Syslog“ + LAMP

2.集成：API 对接、客户端配置、系统管理、SQL 管理、Http 管理；

3.运营与维护：磁盘管理、数据统计与分析；

##### 3. 统计与分析

用于协助计算机的资源与管理；

> **分析**（英语：Analysis）是将[复杂](https://zh.wikipedia.org/wiki/复杂)的话题或事物逐渐拆分的过程，以此来达到对话题更好的理解。
>
> **统计学** 是在数据分析的基础上，研究测定、收集、整理、归纳和分析反映数据数据，以便给出正确消息的科学。这一门学科自17世纪中叶产生并逐步发展起来，它广泛地应用在各门[学科](https://zh.wikipedia.org/wiki/學科列表)，从[自然科学](https://zh.wikipedia.org/wiki/自然科学)、[社会科学](https://zh.wikipedia.org/wiki/社會科學)到[人文学科](https://zh.wikipedia.org/wiki/人文学科)，甚至被用于[工商业](https://zh.wikipedia.org/wiki/工商業)及[政府](https://zh.wikipedia.org/wiki/政府)的情报决策。随着[大数据](https://zh.wikipedia.org/wiki/大数据)时代来临，统计的面貌也逐渐改变，与信息、计算等领域密切结合，是[数据科学](https://zh.wikipedia.org/wiki/数据科学)中的重要主轴之一。
>
> [描述统计学](https://zh.wikipedia.org/wiki/描述统计学)处理有关叙述的问题：是否可以摘要的说明数据的情形，不论是以数学或是图片表现，以用来代表总体的性质？基础的数学描述包括了[平均数](https://zh.wikipedia.org/wiki/平均数)和[标准差](https://zh.wikipedia.org/wiki/標準差)等。图像的摘要则包含了许多种的表和图。主要是就说明数据的集中和离散情形。
>
> [推论统计学](https://zh.wikipedia.org/wiki/推論統計學)被用来将数据中的数据模型化，计算它的概率并且做出对于总体的推论。这个推论可能以对/错问题的答案所呈现（[假设检定](https://zh.wikipedia.org/wiki/假設檢定)），对于数字特征量的估计（估计），对于未来观察的预测，关系性的预测（[相关性](https://zh.wikipedia.org/wiki/相关性)），或是将关系模型化（[回归](https://zh.wikipedia.org/wiki/迴歸)）。其他的模型化技术包括[方差分析](https://zh.wikipedia.org/wiki/變異數分析)，[时间序列](https://zh.wikipedia.org/wiki/時間序列)，以及[数据挖掘](https://zh.wikipedia.org/wiki/数据挖掘)。

1.工具

Program、CLI（Linux Base Shell and Windows PowerShell）、Data storing；

2.对象

服务器、客户端、应用程序、计算机安全等等的计算机资源各个方面。

3.用途

相关的用途：用于论理和论证目标的描述和推论，提供有效的数据。

4.不健全的示例推测

非法登录 ：用户行为 - 操作记录 - 信息统计 - 异常观察 -统计与分析 - 找到目标原因；

异常关机 ：系统行为 - 记录统计与分析 - 前后的异常变动 - 证实描述和推论；

##### Attachment

Reference

1. Microsoft  Docs

   [Get-EventLog -- Powershell 5.1 Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-eventlog)

   [Get-WinEvent -- Powershell 5.1 Docs](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Diagnostics/Get-WinEvent)

   [windows-event-collector](https://docs.microsoft.com/en-us/windows/win32/wec/windows-event-collector)

2. Wikipedia

   [Windows EventViews](https://zh.wikipedia.org/wiki/事件檢視器)
   
   [Server Log](https://zh.wikipedia.org/wiki/服务器日志)
   
   [Category # Analysis](https://zh.wikipedia.org/wiki/Category:分析)
   
   [统计学](https://zh.wikipedia.org/wiki/统计学)
   
3.  [kiwi-free-syslog-server](https://www.kiwisyslog.com/free-tools/kiwi-free-syslog-server)

4. Linux

   [Rsyslog Server building -- 2014](http://blog.sae.sina.com.cn/archives/4768)

   [CentOS 7 LAMP + Rsyslog -- 2018 ](http://baobiy.com/2018/08/26/loganalyzer+rsyslog+mysql搭建/)

   





