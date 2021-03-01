##### Trace Process On Windows

在 Widnows 系统上追踪程序进程

主题 ：追踪“指定”的程序，旨在于协助排查异常、或病毒进程。

>  此为 Use Windows Sysinternals Tools 系列



##### Basic

参考 Wikipedia

> **进程**（英语：process），是指计算机中已运行的[程序](https://zh.wikipedia.org/wiki/程式)。进程曾经是[分时系统](https://zh.wikipedia.org/wiki/分時系統)的基本运作单位。在面向进程设计的系统（如早期的[UNIX](https://zh.wikipedia.org/wiki/UNIX)，[Linux](https://zh.wikipedia.org/wiki/Linux) 2.4及更早的版本）中，进程是程序的基本执行实体；在面向线程设计的系统（如当代多数操作系统、[Linux](https://zh.wikipedia.org/wiki/Linux) 2.6及更新的版本）中，进程本身不是基本运行单位，而是[线程](https://zh.wikipedia.org/wiki/執行緒)的容器。
>
> 程序本身只是指令、数据及其组织形式的描述，相当于一个名词，进程才是程序（那些指令和数据）的真正运行实例，可以想像说是现在进行式。若干进程有可能与同一个程序相关系，且每个进程皆可以同步（循序）或异步（[平行](https://zh.wikipedia.org/wiki/平行計算)）的方式独立运行。现代[计算机系统](https://zh.wikipedia.org/wiki/電腦系統)可在同一段时间内以进程的形式将多个程序加载到存储器中，并借由时间共享（或称[时分复用](https://zh.wikipedia.org/wiki/时分复用)），以在一个[处理器](https://zh.wikipedia.org/wiki/處理器)上表现出同时（[平行性](https://zh.wikipedia.org/w/index.php?title=平行性&action=edit&redlink=1)）运行的感觉。同样的，使用多线程技术（多线程即每一个线程都代表一个进程内的一个独立执行上下文）的操作系统或计算机体系结构，同样程序的**平行**线程，可在多CPU主机或网络上真正**同时**运行（在不同的CPU上）。 

> Windows 进程 ：操作系统使用[进程ID](https://zh.wikipedia.org/wiki/进程ID#Microsoft_Windows)来唯一标识每个进程。在一个进程内部，使用进程[句柄](https://zh.wikipedia.org/wiki/句柄)来标识关注的每个进程。使用Windows API从进程ID获取进程句柄：

**Note**

对于病毒文件的追踪，需要了解一些内容：

进程，不作累述如上文

程序反编译 ，不在此讨论范围。

证书认证，识别异常程序或进程（或识别伪装），可在官网了解到原始证书签名。

隔离，可物理断网  ！（或者禁用驱动也可以）



##### Example Trace Process

获取进程

> [Process cmdlets 管理进程 ](https://docs.microsoft.com/zh-cn/powershell/scripting/samples/managing-processes-with-process-cmdlets)（或许这个会更加简单）

PowerShell（cli）

> PS cli  ：Get-Process -Name 'name'（支持通用匹配符号） |  Select-Object -Property *

Example # 找到文件的所在。

```powershell
PS > Get-Process -PID 16104 | Select-Object -Property Path

Path
----
C:\Program Files (x86)\VMware\Infrastructure\Virtual Infrastructure Client\Launcher\VpxClient.exe
```

辅助工具
> Get-NetTCPConnection ，配合管道 Select-Object、 Where-Object ，接近完美。
>
> Netstat（Batch Command），还是 PoweShell 好用，支持管道。
>
> Process Monitor（gui），好用
>
> Task Manage （gui），系统自带无需额外下载，方便。
>
> TCPView （gui），可看端口绑定的进程，进而参阅看多的信息。



##### Useful

或利用在于其他方面，比如 ：

> + 追踪广告软件，并通过”权限管理“将其封杀（因对“不好的软件”）。
> + 追踪网络，混合 PowerShell + TCPView + Process Monitor ，一条龙服务把问题找出来。
> + 对程序调试感兴趣的可以尝试配合 WinDbg 一起使用。
> + 补充：已及其他有关“程序进程”的问题，都可利用此工具进行追踪。

PS. 作为追踪一个程序，以上全文相关知识和 **工具** 足以。（只适用于 Windows）



##### Appendix · Link

[Windows Sysinternals - Microsoft Docs](https://docs.microsoft.com/en-us/sysinternals/) （建议阅读，并按需求使用）

[Windows Command - Microsoft Docs](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)

[Netstat  - Wikipedia](https://zh.wikipedia.org/wiki/Netstat)

[Collecting Process Monitor Log - acronis](https://kb.acronis.com/content/2295)

[Use netstat blog](http://aries.dyu.edu.tw/~tarng/dyu_c.c/netstat.htm)

