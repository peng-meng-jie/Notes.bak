### Repair Windows System File



造成异常的问题可能难以得知，但是却可以收集相关的信息把问题和假设推论到系统文件异常，比如 Windows Logs、程序报错；

假设计算机异常为：DLL 文件报错；

<u>强调：仅适用于 Windows 10 或更高的版本</u>



#### 基础信息

微软提供的方案

1. 系统重装：耗时长、彻底覆盖、需重新配置（包括系统的授权）；

   主要是系统的授权问题，其他方面和“系统重置”基本一致；

2. 系统重置：耗时长、根据系统原有文件进行修复（不彻底）、需重新配置（软件）；

   无需二外的工具既可以完成相关的操作，当然我更跟建议使用“安全模式”来排查软件是否存在异常在执行本操作；

3. 系统修复：耗时长、利用外部或 Windows 更新文件修复系统（彻底更换）、无需配置；

   不会变更系统配置，需要外置文件支持；

4. Microsoft Command：SFC、或替换异常文件

   基本不会涉及很大系统改动，如果此方式有效，就是此类问题的“最优解”；

解决方案推荐：Command - 修复 - 重置 - 重装



#### 修复异常系统文件

基于情景选择对应的操作和解决方法



##### 情景 1 ：系统可以运行

注意：必须具备管理员权限

###### 1. SFC 系统修复

```powershell
# SFC /? 可以获得更多帮助
SFC /SCANNOW
```

> [sfc | Microsoft Docs](https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/sfc)

###### 2. DISM 系统修复

```powershell
# 使用 Microsoft 服务； 注意：Windows　update　必须可用；
DISM.exe /Online /Cleanup-image /Restorehealth
# 使用本地文件
Dism /Online /Cleanup-Image /RestoreHealth /Source:<指定磁盘>:<指定路径> /LimitAccess
<#
本地文件补充引用
1. 挂载光盘模式；也可以直接使用 Install UI 进行操作；
2. 使用网络文件；
3. 使用 U 盘；
#>
```

>  [Repair a Windows Image](https://docs.microsoft.com/zh-cn/previous-versions/windows/it-pro/windows-8.1-and-8/hh824869(v=win.10))

###### 3. 手动替换已损坏的 DLL 文件

> 如何手动将损坏的系统文件替换为已知完好的文件副本，参阅下文：
>
> [use-the-system-file-checker-tool-to-repair-missing-or-corrupted-system](https://support.microsoft.com/zh-cn/help/929833/use-the-system-file-checker-tool-to-repair-missing-or-corrupted-system)

###### 4. 恢复 Windows 系统，可重置电脑

> [windows-10-recovery-options](https://support.microsoft.com/zh-cn/help/12415/windows-10-recovery-options)



##### 情景 2 ：系统无法运行

注意：需具备 U 盘或者光盘

###### 1. PE 

U 盘 PE ：第三方 PE 系统，扩展性强；Microsoft Install  修复或安装系统；

已刻录的光盘：修复或安装系统

###### 2. Note

此部分和上面那一部分思维上是重复的，不作重复描述，也不详细记（超出文本的预期）。

操作部分建议：”Google 是你的朋友“，可以获得更为健全、纤细的知识和指导；



#### Appendix

Reference

1. Microsoft Docs

   [use-the-system-file-checker-tool-to-repair-missing-or-corrupted-system](https://support.microsoft.com/zh-cn/help/929833/use-the-system-file-checker-tool-to-repair-missing-or-corrupted-system)

   [Repair a Windows Image](https://docs.microsoft.com/zh-cn/previous-versions/windows/it-pro/windows-8.1-and-8/hh824869(v=win.10))

   [windows-commands](https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/windows-commands)

   [DISM - 部署映像服务和管理](https://docs.microsoft.com/zh-cn/windows-hardware/manufacture/desktop/dism---deployment-image-servicing-and-management-technical-reference-for-windows)

   [windows-10-recovery-options](https://support.microsoft.com/zh-cn/help/12415/windows-10-recovery-options)

   

