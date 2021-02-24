##### Use Debugging Tools for Windows 

使用 Windows 调试工具

> !!!  Warning : This topic is for programmers.  !!!

主题：以最接近计算机科学基础的方式（函数、类、内存、进程、线程 ... ）去调试、发现和尝试解决程序的异常问题。

注意：虽然该工具经有可能的收集错误的的信息方便排错，但它依然无法完全和代表“原始环境”。



##### 1）Basic （Node）

Debug 调试

> + 单机调试，使用“驱动”的方式对内核进行改动，迫使系统产出 Dump 文件。
> + 联机调试，使用“远程”联机的方式对主机进行调试，并产出 Dump 文件（微软默认的做法）。

类型

> “内核模式”是处理器访问模式，操作系统和特权程序以此模式运行 。 内核模式代码有权访问系统的任何部分，而不像用户模式代码那样受到限制。 内核模式代码可以访问在用户模式或内核模式下运行的任何其他进程的任何部分。 许多核心操作系统功能和许多硬件设备驱动程序在内核模式下运行。
>
> “用户模式”是计算机上的应用程序和子系统运行的模式 。 在用户模式下运行的进程在其自己的虚拟地址空间中运行。 它们受到限制，无法直接访问系统的许多部分，包括系统硬件、未分配给它们使用的内存以及可能损害系统完整性的系统其他部分。 由于以用户模式运行的进程与系统和其他用户模式进程有效隔离，因此它们不能干扰这些资源。

附 ：关于文件类型

> 当系统发生错误是，最常见的就是蓝屏（Blue screen），这时就会在系统目录下产生一个Dump文件，如MEMORY.DMP 。这个文件的主要意义在于分析系统错误发生的原因，以作出解决的方法。
> 它可分为三种类型：
>
> 1. 完全内存转储。这个文件比较大，和物理内存相当，包含了程序崩溃前系统及用户模式下的所有信
>    息。
>    
> 2. 核心内存转储。这个文件大小约物理内存的三分之一，主要包含崩溃前系统内核的运行情况。一般
>    为了分析内核错误，就选用这种文件。
>    
> 3. 小内存转储。这个文件小，只有64k，刚好一个页面文件大小。它包含了相对比较少的信息，主要可用于微软的在线分析。
>
> 以上三种形式的文件可以在我的电脑——〉鼠标右键——〉属性——〉高级——〉故障及恢复中设置
>

Command line

> https://docs.microsoft.com/zh-cn/windows-hardware/drivers/debugger/command-line-options

转储文件（Windows *.Dump File）

> **有关”转储文件“**
>
> 发生内核模式错误时，Microsoft Windows 的默认行为是显示带有 bug 检查数据的蓝屏。
>
> 但是，可以选择以下几种替代行为：
>
> - 可以联系 (的内核调试器，如 WinDbg 或 KD) 。
> - 可以写入内存转储文件。
> - 系统可以自动重启。
> - 可以写入内存转储文件，并且系统可以在以后自动重新启动。
>
> 本部分介绍如何创建和分析内核模式内存转储文件。 有三种不同种类的故障转储文件。 但是，应记住，任何转储文件都不能像连接到发生故障的系统的实时内核调试器一样有用。
>
> **对于 Win 系统通过 bugcheck 所产生的 dump 文件，包含以下内容：**
>
> - 停止消息、其参数和其他数据
> - 加载的驱动程序列表
> - 已停止 (处理器) 的处理器上下文
> - 进程信息和内核上下文 (停止) 进程使用 EPROCESS
> - 进程信息和内核上下文 (停止) 线程的 ETHREAD 进程
> - 已停止的线程的内核模式调用堆栈

“解释库”

> Symbol search path is: srv* < Microsoft server ip or web-site>
>
> 具体以文档为准，可自主搭建。

Note

其相关的知识是另一个专业的领域，软件测试。由于目前的岗位并非软件测试，所以并不需要深入对此进行学习和大量的实践，反而作为一种借助的解决方案会更好，更适合目前的需求。只想那它来解决一些无法解释的计算机问题（比如蓝屏、系统故障）、难以借助日志分析的程序错误。



##### 2）Example 1，Use Windows Dump Analysis Auto Restart ！	-tag debug	-static c

+ Problem

  操作指定的“软件”时导致系统重启 ！

+ Analysis

  **基础信息收集**

  基础信息 ：得知系统以存储 Dump 文件，尝试 Debug Review 方式得知问题的原因。

  基于故障设备 dump 文件和 windbg 工具，收集到以下信息：

  > ```powershell
  > # dump-file-node : 
  > # !analyze
  > <# 
  > PROCESS_NAME:  System
  > SYMBOL_NAME:  nt!KiExceptionExit+10c
  > MODULE_NAME: nt
  > IMAGE_NAME:  ntkrpamp.exe
  > FAILURE_BUCKET_ID:  0xA_nt!KiExceptionExit+10c
  > #>
  > ```

  未找到最终的问题，初步判断为“内存读取异常”。其外判断为“驱动异常”。

  **实验**

  内存检查，使用内置的 Windows 工具检查内存，没有问题。

  驱动检查，近期 Windows 无更新，与驱动文件更新无关。

  硬件 IO ，硬件松动导致电脑重启，并进行重复测试。问题确认

  **再实验**

  基于硬件 IO 移动造成的蓝屏现象，并收集系统 Dump 文件（WinDbg），分析内容和报错信息均一致。

  问题定向：IO 接口不固定，造成内存和驱动的交互异常，导致“电脑无故重启”。

+ Countermeasures

  固定接口、或者跟换更为稳定接口。

+ Note

  借助 Windows System Dump 、Event 和 WinDbg 分析问题，并检查硬件的情况，找出问题后使用相关解决方案来解决该问题。

  和清除 IO 接口排除有何区别 ？WinDbg 能够让更深入计算机知识（函数、方法、内存、进程与线程）的问题进行故障处理，看到计算机的深度，决定了所看到计算机的广度。
  
+ Link

  [如何在发生崩溃时读取由 Windows 创建的小内存转储文件](https://docs.microsoft.com/zh-cn/troubleshoot/windows-client/performance/read-small-memory-dump-file)

  

##### 3）Example 2，Debugging Windows Program（Notepad）

+ Tagger

  随机实验 ：调试 ~~PowerShell~~ Notepad（程序 - 进程），并查看其底层运作原理。

  > 仅用于用户模式，内核模式不此范围以内。

+ Basic

  Link ：[getting-started-with-windbg - Microsoft  Docs](https://docs.microsoft.com/zh-cn/windows-hardware/drivers/debugger/getting-started-with-windbg)

  Use Flow

  > 1. 附加程序
  > 2. 查找相关的函数
  > 3. 设定相关断点标记
  > 4. 开始调试
  > 5. 对计算机底层进行追踪
  > 6. 找到问题

+ Note

  难点 ：函数、方法、内存、进程、线程

  

##### 4）Extend

Note ：此工具面向于开发阶段，用于调试驱动程序，并能够在一定程度上支持“蓝屏排除”。	

Tools : [ProcDump - microsoft docs](https://docs.microsoft.com/en-us/sysinternals/downloads/procdump)

> ProcDump is a command-line utility whose primary purpose is monitoring an application for CPU spikes and generating crash dumps during a spike that an administrator or developer can use to determine the cause of the spike. ProcDump also includes hung window monitoring (using the same definition of a window hang that Windows and Task Manager use), unhandled exception monitoring and can generate dumps based on the values of system performance counters. It also can serve as a general process dump utility that you can embed in other scripts.

Note : 

该工具配合示例 2 进行使用会更好，比如 崩溃的程式、无法响应的程序 等等有关 Windows 进程。拿到转储文件（*.dump）然后进行故障的分析，这将会起到很大的作用。

或者还有其他的方法和技术（可能会与其他 Windows Sysinternals 进行使用，比如 Portmon 、Process Explorer、Process Monitor）

PS. 目前够用，点到为止



##### X）Appendix 

**Link**

[Debugger - Microsoft Docs](https://docs.microsoft.com/zh-cn/windows-hardware/drivers/debugger/)

[Getting Started with Windows Debugging - Microsoft Docs](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/getting-started-with-windows-debugging)

[有关 Windbg 聚合信息站 （第三方）](https://www.pianshen.com/tag/windbg/)

[Windbg Dump Analysis Note - csdn](https://blog.csdn.net/bcbobo21cn/article/details/60468969)

[Windbg Analysis Simple Example - csdn](https://blog.csdn.net/hustd10/article/details/52075324)

[Windows Sysinternals - Microsoft Docs](https://docs.microsoft.com/en-us/sysinternals/)



