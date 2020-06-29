### 使用 Power Shell 获得电脑的信息

使用 CLI 快速获得主机信息，配合 bat+Task 可以达到自动化处理的效果；

###### 1. Systeminfo

提醒：支持 Windows 7 的 CMD，systeminfo /？可获得帮助信息；

- 在 Powershell 中输入 systeminfo 默认可以获得本机的电脑信息；

- 支持查看局域网其他主机的的信息；

  > systeminfo /s LAN-HOST （支持主机名称、IP 地址）

###### 2. Get-Ciminstance

很强大，支持内嵌套 “SQL 语法”，按需使用即可；

下文以查询 Windows fix update 为例子

> Get-CimInstance -ClassName Win32_QuickFixEngineering
>
> 还有跟符合目的的 Get-hotfix
>
> > 查看本地计算机：get-hotfix 
> >
> > 查看远程计算机：get-hotfix -computername fab-111（or LAN-Host / IP）

###### 3. Get-Help

对于复杂强大的 Powershell 当然需要一个帮助来协助你完成任务；

> Get-Help Format-Table 
>
> Get-Help -Name Format-Table 
>
> Format-Table -?

提示：第一次使用需要安装离线文档，根据系统主机的处理效率存在差异

###### 附录

1. [PowerShell Module Browser](https://docs.microsoft.com/en-us/powershell/module/)
2. [Sample scripts for system administration](https://docs.microsoft.com/en-us/powershell/scripting/samples/sample-scripts-for-administration?view=powershell-7)
3. [Get-Help](https://docs.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/Get-Help?view=powershell-7)





