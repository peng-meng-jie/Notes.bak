##### Use VSS in the Windows client 

在微软窗口系统客户端版本中使用“影卷复制服务”

> 做个小工具，实现一些小需求。
>
> 现成方案 ：[shadowspawn](https://github.com/candera/shadowspawn/downloads)



##### 1）Inbox

[Shadow Copy](https://en.wikipedia.org/wiki/Shadow_Copy)

> **卷影复制服务**（英语：Volume Shadow Copy Service）是[微软](https://zh.wikipedia.org/wiki/微軟)[Windows](https://zh.wikipedia.org/wiki/Microsoft_Windows)的一项组件服务，从[Windows Server 2003](https://zh.wikipedia.org/wiki/Windows_Server_2003)开始支持。
>
> 卷影复制服务是一项定时为分卷作复制的服务。服务会在分卷新增一个名为“阴影复制”（Shadow Copy）的选项。这服务可为离线用户提供离线文件服务。
>
> 欲使用这项技术，文件系统必须为[NTFS](https://zh.wikipedia.org/wiki/NTFS)，才可创建和存储分卷阴影区复制。分卷阴影区复制可以由任何使用此技术的Windows原建在本地或外部磁盘（卸除式磁盘或网络磁盘）上创建。举例而言，调度的[Windows备份](https://zh.wikipedia.org/wiki/備份與還原中心)或[系统还原点](https://zh.wikipedia.org/wiki/系統還原)时会用到此技术。

[VssAdmin](https://go.microsoft.com/fwlink/?linkid=84008)

> Applies To: Windows Server 2003, Windows Server 2008, Windows Server 2003 R2, Windows Server 2008 R2, Windows Server 2012, Windows 8 
>
> 可创建服务的主机发行版范围，没有 Windows 7、10 的发行版

[How-to-use-vssadmin（Microsoft Server）](https://github.com/nixawk/pentest-wiki/blob/master/4.Post-Exploitation/Windows_ActiveDirectory/How-to-use-vssadmin.md)

> 创建 VSS 在服务器上使用方式，可借助于此来创建和管理活动。

[Win32_ShadowCopy class](https://docs.microsoft.com/en-us/previous-versions/windows/desktop/legacy/aa394428(v=vs.85))

> Windows 隐藏了接口，但可以通过 WMIC 调用
>
> ```powershell
> # get existing shadow copies
> $shadow = get-wmiobject win32_shadowcopy
> "There are {0} shadow copies on this sytem" -f $shadow.count
> ""
> # get static method
> $class=[WMICLASS]"root\cimv2:win32_shadowcopy"
> # create a new shadow copy
> "Creating a new shadow copy"
> $class.create("C:\", "ClientAccessible")
> # Count again
> $shadow = get-wmiobject win32_shadowcopy
> "There are now {0} shadow copies on this sytem" -f $shadow.count
> ```

[WMI](https://docs.microsoft.com/zh-cn/windows/win32/wmisdk/wmic)

> The WMI command-line (WMIC) utility provides a command-line interface for Windows Management Instrumentation (WMI). WMIC is compatible with existing shells and utility commands. The following is a general reference topic for WMIC. For more information and guidelines on how to use WMIC, including additional information on aliases, verbs, switches, and commands, see [Using Windows Management Instrumentation Command-line](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc779482(v=ws.10)) and [WMIC - Take Command-line Control over WMI](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/bb742610(v=technet.10)).

[Create VSS in Windows 10](https://superuser.com/questions/1125601/cant-create-shadow-copy-in-command-line) 

> 通过 PowerShell 进行调用该函数，并使用
> ```powershell
> # 1.powershell-create-vss
> powershell.exe -Command (gwmi -list win32_shadowcopy).Create('D:\','ClientAccessible')
> # 2.wmic-create-vss
> wmic shadowcopy call create Volume='E:\'
> ```

[how-to-enable-volume-shadow-copy-using-powershell](https://serverfault.com/questions/259381/how-to-enable-volume-shadow-copy-using-powershell)

> 可以使用，支持一下两点操作
>
> 1. Creating a shadow copy as shown in the preceding article
> 2. Creating a scheduled task to create shadow copy



##### 2）Build And Use

**数据备份**

> 核心功能已完成，其他需求根据需求而增加

PowerShell

```powershell
# Win-Workstation-VSS.ps1
function Copy-Shadow-File{
    param (
        [string[]]$Path,
        [string[]]$ToBak   
    )
    (Get-WmiObject -list win32_shadowcopy).Create($Path,'ClientAccessible') # Crete VSS
    $ShadowDisk='NA' # 需要正则表达式，过滤字符，只要”磁盘符“
    $ShadowDiskPath='NA' # 需要正则表达式,过滤路径的字符串，只要”路径“
    $TempPath='\\localhost\'+$ShadowDisk+$ShadowDiskPath
    Copy-Item -Path $TempPath -Destination $ToBak
    vssadmin.exe delete shadows /for=$disk /All /Quiet
}
# Example-Tests
# Copy-Shadow-File -Path 'C:\Windows\System32' -ToBak 'd:\Backup\'
```

Windows Batch

```powershell
#没有实际的论据，但从API的角度而言，是可行的
wmic shadowcopy call create Volume='C:\'
copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\NTDS\NTDS.dit C:\temp\
vssadmin.exe delete shadows /for=$disk /All /Quiet
```

可扩展

> + 指定路径，指定备份
> + 自动判断
> + 延长备份存储周期



##### 3）Extend

数据备份

> 工作站、服务器

数据处理

> 分支执行，然后迭代汇总

WMI 工具扩展

> 原来如此，还可以升级一个等级，直接修改系统文件，达成小工具一举



##### X）Appendix

**Link**

[volume-shadow-copy-service](https://docs.microsoft.com/zh-cn/windows-server/storage/file-server/volume-shadow-copy-service)（核心部分）

[VssAdmin](https://go.microsoft.com/fwlink/?linkid=84008) （核心部分）

[Shadow Copy](https://en.wikipedia.org/wiki/Shadow_Copy)

[how-to-enable-volume-shadow-copy-using-powershell](https://serverfault.com/questions/259381/how-to-enable-volume-shadow-copy-using-powershell)

[Create VSS in Windows 10](https://superuser.com/questions/1125601/cant-create-shadow-copy-in-command-line) 

[Win32_ShadowCopy class](https://docs.microsoft.com/en-us/previous-versions/windows/desktop/legacy/aa394428(v=vs.85))

[WMI](https://docs.microsoft.com/zh-cn/windows/win32/wmisdk/wmic)

[How-to-use-vssadmin（Microsoft Server）](https://github.com/nixawk/pentest-wiki/blob/master/4.Post-Exploitation/Windows_ActiveDirectory/How-to-use-vssadmin.md)

**Extend**

[Use VSS in Windows Server（including Windows-Explorer-File-History）](https://mcpmag.com/articles/2015/12/07/creating-volume-shadow-copies.aspx)



