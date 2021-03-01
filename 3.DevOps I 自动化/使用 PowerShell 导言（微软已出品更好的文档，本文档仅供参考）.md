#### 使用 PowerShell 导言



概述

本文内容包含内容如下，熟悉、了解、设计和维护；

> 1. 熟悉 Windows 脚本的基础语法（PowerShell）
> 2. 了解 Windows 版本环境
> 3. 目前辅助的脚本设计思路

为了避免没有人有维护已创建的代码。

> 对于专业的人员而言，有注释就够了。
>
> 如果你不需要管理 Windows Server，这篇文章可以选择不看。



##### 1. 熟悉 PowerShell 

> 请查阅相关的文档

PowerShell 的特性

> 与 Windows 系统集成、.NET.Core  跨平台；
>
> 主要功能：可以管理 Windows Server（“就是 Windows 版本的 Bash CIL 平台”）

基础语法

> 变量、选择、循环、条件语句、函数



##### 2. Windows 环境

> PowerShell  目前稳定发行版为 PowerShell 7 --2020.11

系统默认版本

Win 7 // ps2.0

> 很旧的发行版，没有文档可查，不推荐使用。
>
> 注意：
>
> 1. 帮助可参阅 get-help <cmdlet> 
> 2. 注意跨版本的兼容性问题

Win 10 // ps5.0

> 支持大部分的代码，官方中有相关的版本文档可以参考。
>
> 接近稳定的发行版，在 PowerShell 7 中能够运行的代码，PowerShell 5 中基本也能够运行。

Windows batch // 以服务器发行版作为参考

> 虽然 Microsoft 已经停止了对 batch 的开发，并推荐使用 PowerShell ，但是目前在 Windows 发行版中依然附有 batch 的程序。这意味着有些事情可以使用 batch 脚本来处理，最主要的优势还是客户端，单机就启动其代码，处理一些简单的问题，可以拿“拍手称快”来形容。
>
> 注：了解即可

扩展

> 可适当了解
>
> Windows 系统环境；
>
> PowerShell 全局变量；
>
> 或许还有更多，才疏学浅（只能列举到此），更多功能等着你来发现。



##### 3. 设计的思路

**面向对象**（可忽略）

这个没有去实际的验证，和引用相关的文档。

因为这一部分大多数以 Python 脚本完成，而不是 PowerShell，没有话语权，也不做推荐。



**函数式**

PowerShell 支持函数式编程，封装你的方法，比如过滤时间、字符串格式化等等。当然也支持自定义“ PowerShell 的函数库”嵌套至系统，方便个人的使用。

大致：开始 - 常量和基础数据 - 函数封装方法（选择、过滤、分析、格式化等等） - 引用函数 - 结束

```powershell
# PowerShell 函数

function FunctionName {
    param (
        OptionalParameters
    )
    
}
```



**流程式**，类似于流程框图的处理流程

大致：开始 - 选择 - 处理 - 再选择 - 直到获取到预计的结果 - 结束

<u>注：本文的脚本以此设计思路为基础</u>



##### 4.维护脚本

简述

基于“流程式”的代码思路而开发，自上而下运行。

基本流程如下

> 1. 常量：包含时间、路径、获取参数、加密用户凭证等常量；
> 2. 复制数据
> 3. 比对数据
> 4. 打开相关文件
> 5. 复核

涉及相关问题

> 文本加密、文件处理、文本格式化、数据核对、获取参数等等

可改进的内容

> 1. 改为函数式开发；
> 2. 更多的数据过滤结构；
> 3. 执行完成后的数据报表

进行维护

> 代码中已有中注释，请根据注释进行修改相关的参数；
>
> 注：更多关于 PowerShell 的功能，请查阅附录 Release 1. Microsoft 的内容；
>



相关脚本代码如下 I Scripts Code 

> 注：本脚本涉及到关键数据，以作屏蔽处理，标记：None

```powershell
# Backup_E021_Udisk.ps1
# runas Administrator : Set-ExecutionPolicy RemoteSigned
# [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($base64_str), 'InsertLineBreaks')

# login_nas
# $server = 'Base64-none' #
$server_ip = 'Base64-none'
$user = 'YQBkAG0AaQBuAA=='
$pass = 'Base64-none'
$read_server = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($server_ip))
$read_user = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($user))
$read_pass = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($pass))
# cmdkey.exe /add:$read_server /user:$read_user /pass:$read_pass

#get disk
"0.show data disk"
Get-Volume | where-object {$_.DriveType -eq "Removable"}
$disk = Read-Host "Enter Disk "
$disk = $disk.ToUpper()

# string
$days = Get-Date -Format "yyyyMMdd"
$days_ranger_2 = Get-Date -Format "yyMMdd"
$file1 = "$disk"+":<None>\H"+"$days_ranger_2"+"A.HDA"
$file2 = "$disk"+":<None>\B"+"$days_ranger_2"+"A.CSV"
$NAS_PATH = "\\$read_server\<None>\$days\"
$file1

"1. backup" 
cmdkey.exe /add:$read_server /user:$read_user /pass:$read_pass
New-Item -Path "\\$read_server\<None>\" -Name $days -ItemType "directory"
Copy-Item -Path $file1 -Destination $NAS_PATH 
Copy-Item -Path $file2 -Destination $NAS_PATH

$E021_local = Get-ChildItem -Path $file1 -Force -Recurse
$E021_loca2 = Get-ChildItem -Path $file2 -Force -Recurse
$E021_NAS = Get-ChildItem -Path $NAS_PATH -Force -Recurse
$E021_NAS

"2. Compare"
Compare-Object -ReferenceObject $E021_local -DifferenceObject $E021_NAS
Compare-Object -ReferenceObject $E021_loca2 -DifferenceObject $E021_NAS

"3. open folder"
Invoke-Item $NAS_PATH
Invoke-Item "$disk"+":\DEVICE01\"
cmdkey.exe /detele:$read_server
```



##### Appendix

**Release**

1. Microsoft

   [windows commands docs](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)

   [powershell docs](https://docs.microsoft.com/zh-cn/powershell/)

   其他：搜索引擎 <你需要的信息> -site:microsfot.com 或者直接在 Microsoft Docs 中搜索文档

2. 个人文档

   PowerShell 语法与自动化

   PowerShell 数据加密与传输

3. Link

   

   
   
   

