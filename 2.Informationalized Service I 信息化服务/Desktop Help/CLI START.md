### CLI START

别名：基于 cmd 或 powershell  START 程序或其他信息

每次打开某个系统应用模块都需要进行其他的额外步骤，可不可把它简化掉，减少打开不必要的应用界面。

微软系统集成的 Windows Search 是面向所有的用户群体简单方便。它在新版的系统（Windows 10 2004）中根据优势，Windows 7 则表现不佳，另外对于没有接触过的群体需要一定的时间、思考和积累。

本文主要使用 powershell 用户无需接触和学习计算机的技术，只需一点即用，更关注自己的业务即可。

#### START Mehod

面向用户使用：Batch + Powershell

管理用户直接使用：Powershell

**bat**

> 单一直观，点击即可运行，关于 BAT 编辑参阅 《 Poweshell 语法与自动化 》；
>
> 本文使用 SET + PowerShell -Command  <command> ，指令不支持脚本式（或者函数式），经测试只能单命令直接使用

**powershell**

> 不可直接打开，需要事先打开 powershell 启动的简单方式不如 BAT 的启动方式。

bat + powershell

> 间接打开或引导 powershell，点击即可运行，混合使用需要搭配本地部署或局域网部署。

**Win + R**

> 对于系统特定的程序，它就是命令台的快捷启动方式之一。

**Windows GUI + lnk**

> 类似于 BAT 的启动方式，局限于资源管理器能看到资源的“软链接”，基于 GUI 操作，原始数据为 16 进制。

#### Command

参阅附录的链接可获得更健全的信息，或者在 Powershell 使用 Get-Help <Command> 、<Command> ?

**Invoke-Item**

> 打开文件夹
>
>  Invoke-Item 'D:\OneDrive\'
>
> 打开程序
>
>  Invoke-Item 'powershell.exe'

**Start-Process**

> 只用于打开程序
>
>  Start-Process -FilePath "powershell.exe"

**control.exe**

> 启动方式：cmd 、powershell 、Win + R ;
>
> control.exe /name Microsoft.DevicesAndPrinters

**other**

> 参阅 Microsoft docs 支持的内容和自主编写；

#### Application

以启动控制面板的打印机界面为例，其他需求可以根据实际情况更改。

SET + PowerShell -Command  <command> 完全符合用户群体。

```Batch
@ECHO OFF

TITLE START-Control-Print
SET command="control.exe /name Microsoft.DevicesAndPrinters"
POWERSHELL -command %command%

pause
```

对于管理员，直接使用 powershell 效果更佳

```powershell
<#
 -- Win + S ( START Windows search ) -- 
 
PS > Get-Date # 获取系统时间
PS > Get-StartApps # 获取应用程序
PS > Get-childitem -path "D:\" # 获取指定路径下的文件夹和文件数量

#>
```

#### Attachment

关联

Powershell、Batch、DOS Command、command 启动流程；

Reference

1. Microsoft Docs

   [PowerShell Module Browser](https://docs.microsoft.com/en-us/powershell/module/)

   [controlpanel-canonical-names](https://docs.microsoft.com/zh-cn/windows/win32/shell/controlpanel-canonical-names)
   
   [executing-control-panel-items](https://docs.microsoft.com/zh-cn/windows/win32/shell/executing-control-panel-items)



