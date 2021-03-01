#### Microsoft.PowerShell And FileSystem（Include CAL）



##### 概述

**背景**

使用 MSTSC 管理服务器, 只能够单页面管理, 而且很像一个个打开了一个程序进行管理.它存在这些缺点 : 

> 它的画面是有限的、文件传输同理，额外的图像传输操作服务器和客户端以及网络的负担.

**需求：寻找更好更有效的管理办法**

"面向传统的操作方式 CLI"，Windows Server 2012 开始就支持使用 PowerShell 管理服务器, 它的默认配置 : 默认开始可以 ps 远程连接服务器, 这就意味我可用通过 ps command 管理服务器. 所以文本有 2 个方向作为测试和实践:

> 1. 远程管理
> 2. 文件管理



**简述**

内容为 PowerShell 的基础知识，并且包含 CAL 的操作和查询，以实际运用和思路作为结束。

> 对于本文的查阅建议，请先查阅 附录1.Flows 建议

[TOC]

#### 1. 基础知识

##### 1.2 什么是 PowerShell ?

微软的产品，只要你用到 Windows 系统就会涉及到该技术。

典型的例子就是，它在服务器管理中很有效，它可以在一定程度上解放 IT 管理员的双手。从而让管理员更专注本职的工作，二不是在 GUI 的“复杂”信息中操作和重复以往的步骤。如果你是 IT 管理员，并且 Windows Server 业务较多的话，你会喜欢上它的”高效率“。

简而言之：PowerShell 就是 Windows CLI 和脚本化的典型代表，并且有微软负责开发和提供技术支持，对 Windows Server 的支持性很好。

> 个人历程
>
> 个人因为之前没有看到官方的教程, 从而找了一圈, 浏览了一些 Blog 文章, 了解"基础的语言特性和语法" , 从此就入门了. 途中遇到了许多问题, 借助 Google 和 PowerShell Docs 解决的许多的问题, 并且在不同的文章均有讨论 PowerShell . 现在我发现了"经官方推荐的教程" (心情就像发现了美洲新大陆一样),  名称 : PowerShell 101 , 它是一个很好的入门教程.

更好的了解 PowerShell 

> [什么是 PowerShell ？ ](https://docs.microsoft.com/zh-cn/powershell/scripting/overview)

如果需要使用 PoweShell , 它可以很好的帮助到你.

> [PowerShell 101](https://docs.microsoft.com/zh-cn/powershell/scripting/learn/ps101)

或许你没有时间或者其他原因. 

> Google 或会成为你好“助手”。



下面为实践和测试部分

##### 1.2 在 CLI 中获得帮助

Get-Command	//	Get-Command -Noun Process	# 获得指令

> Get-Command -Noun Process	//	获得软件进程相关的 Cmdlet
>
> Get-Command -Noun server*	//	获得服务相关的 Cmdlet

Get-Help	//	Get-Help -Name Get-Help	# 获得帮助

> Get-Help -Name Get-Help， 只需要把后面的参数换成其他 “Cmdlet”即可。

Get-Member	//	Get-Service | Get-Member 	# 获得该函数的方法

> Get-Service | Get-Member	//	返回指定的 Cmdlet 的方法



##### 1.3 发现对象、属性和方法

运用你所学的知识，示例

获得方法，“对象”的方法

示例：查询用户是否已被 AD “锁上” ！

Code

```powershell
<#	
# 运用知识发现对象、属性和方法，用于查询 AD 账号的状态 
此处代码直接引用官方文档的数据，AD 账号为：mike

# 基础
get-member 返回方法
get-help 命令帮助
get-command 获得指令
#>
Get-Command -Module ActiveDirectory	# 获得 AD 相关的命令
Get-ADUser -Identity mike | Get-Member # 获得该对象返回的方法（消耗服务器资源）
Get-ADUser -Identity mike -Properties * | Get-Member # 更详细地获得该对象返回的方法（消耗服务器资源）
$Users = Get-ADUser -Identity mike -Properties * # 获得该对象“所有的信息”
$Users | Select-Object -Property Name, LastLogonDate, LastBadPasswordAttempt # 基于本地数据进行过滤
Get-ADUser -Identity mike -Properties LastLogonDate, LastBadPasswordAttempt　# 即时使用 ps-cli 获得 ad-user 状态

# 注：执行本命令无需管理员权限。
```

Note

主要在于学习它的”发现“，学会在本系统（即 PowerShell ）中寻找相关的：方法、属性、对象。

这一点能够做好的话，面对一个 Windows Server Only PowerShell Command 完全不再话下。

思路大致如此

> 1. 模糊的查找指令	
>
>    get-command
>
> 2. 简单了解该指令的用法 
>
>    get-help
>
> 3. 进一步发现它的对象、属性、对象
>
>    get-member
>
> 4. 缩小拟定的范围
>
>    -指定参数 + get-member
>
>    -指定参数  指定方法
>
>    > 或许可以用：where-object、select-object 过滤你的信息
>
> 5. 使用你所认知的指令
>
>    比如上文的这个指令
>
>    > Get-ADUser -Identity mike -Properties LastLogonDate



##### 1.4 PowerShell 语言特性

A、正确的使用管道传输数据，规则：从左到右

B、创建“常量”，

> $CustomObject = [pscustomobject]@{  Service = 'w32time' }
>
> 我倒是人为： $CustomObject = 'w32time' 或许会更好用一些

注：单双引号存在区别

C、PowerShellGet

类似于 Python PIP 的包库，这是 PowerShell 第三方库管理。

D、输出内容格式化

 Format-List 、Format-Table

E、别名

Get-Alias

F、比较运算符

| 操作符         | 其定义                     |
| :------------- | :------------------------- |
| `-eq`          | 等于                       |
| `-ne`          | 不等于                     |
| `-gt`          | 大于                       |
| `-ge`          | 大于或等于                 |
| `-lt`          | 小于                       |
| `-le`          | 小于或等于                 |
| `-Like`        | 使用 `*` 通配符进行匹配    |
| `-NotLike`     | 不使用 `*` 通配符进行匹配  |
| `-Match`       | 匹配指定的正则表达式       |
| `-NotMatch`    | 不匹配指定的正则表达式     |
| `-Contains`    | 确定集合中是否包含指定的值 |
| `-NotContains` | 确定集合是否不包含特定值   |
| `-In`          | 确定指定的值是否在集合中   |
| `-NotIn`       | 确定指定的值是否不在集合中 |
| `-Replace`     | 替换指定的值               |

G、提供程序

PowerShell 中的提供程序是一种允许文件系统访问数据存储的接口。 PowerShell 中提供了许多内置提供程序。

Get-PSProvider

H、循环

```powershell
# ForEach-Object 是用于循环访问管道中的项的 cmdlet，例如使用 PowerShell 单行命令。 ForEach-Object 通过管道流式处理对象。

'ActiveDirectory', 'SQLServer' |
   ForEach-Object {Get-Command -Module $_} |
     Group-Object -Property ModuleName -NoElement |
         Sort-Object -Property Count -Descending
        
$ComputerName = 'DC01', 'WEB01'
foreach ($Computer in $ComputerName) {
  Get-ADComputer -Identity $Computer
}

# 当指定的条件为 true 时，for 循环会进行循环访问。
for ($i = 1; $i -lt 5; $i++) {
  Write-Output "Sleeping for $i seconds"
  Start-Sleep -Seconds $i
}

# PowerShell 中有两个不同的 do 循环。 指定的条件为 false 时，Do Until 运行。
$number = Get-Random -Minimum 1 -Maximum 10
do {
  $guess = Read-Host -Prompt "What's your guess?"
  if ($guess -lt $number) {
    Write-Output 'Too low!'
  }
  elseif ($guess -gt $number) {
    Write-Output 'Too high!'
  }
}
until ($guess -eq $number)

# Do While 正好相反。 只要指定条件的计算结果为 true，它就会运行。
$number = Get-Random -Minimum 1 -Maximum 10
do {
  $guess = Read-Host -Prompt "What's your guess?"
  if ($guess -lt $number) {
    Write-Output 'Too low!'
  } elseif ($guess -gt $number) {
    Write-Output 'Too high!'
  }
}
while ($guess -ne $number)

# 与 Do While 循环类似，只要指定的条件为 true，While 循环就会运行。
$date = Get-Date -Date 'November 22'
while ($date.DayOfWeek -ne 'Thursday') {
  $date = $date.AddDays(1) 
}
Write-Output $date

for ($i = 1; $i -lt 5; $i++) {
  Write-Output "Sleeping for $i seconds"
  Start-Sleep -Seconds $i
  break # 中断
}

while ($i -lt 5) {
  $i += 1
  if ($i -eq 3) {
    continue # 跳过本次步骤
  }
  Write-Output $i
}

$number = 1..10
foreach ($n in $number) {
  if ($n -ge 4) {
    Return $n # 退出该“工作域"
  }
}
```

##### 1.5 WMI

WMI 可以提供”管理底层“中的方法和属性，比如 ：返回主机 BIOS 信息、或者微软提供的数据接口等。

由于对这方面不熟悉，上链接：

> [Windows Management Framework](https://docs.microsoft.com/zh-cn/powershell/scripting/windows-powershell/wmf/overview)
>
> [Windows Management Instrumentation](https://docs.microsoft.com/en-us/windows/win32/wmisdk/wmi-start-page)

Note：个人认为了解即可，需要的时候在进一步查阅和使用。



##### 1.6 远程管理

相关 cmdlet 

> Get-Credential / Enter-PSSession / Invoke-Command 

获取支持 ”WinRM“的 cmdlet 

```powershell
Get-Command -ParameterName ComputerName
```

连接服务器

```powershell
$Cead = Get-Credential
Enter-PSSession -ComputerName dc01 -Credential $Cred
# 退出 exit 即可
```

批量处理

```powershell
Invoke-Command -ComputerName dc-drk, dc-hoqui {Get-Service -Name Win32Time } -Credential $Cead
```

Get-Credential 有个缺点，每次运行都会提示凭证的管理。用 New-PSSession 就好了。大致如下：

```powershell
# 获取凭证至 ps-command 环境
$Session = New-PSSession -ComputerName dc01, sql02, web01 -Credential $Cred 
# 传参，需要在计算机后面附加内容即可
Invoke-Command -Session $Session {(Get-Service -Name W32time).Start()}
Invoke-Command -Session $Session {Get-Service -Name W32time}
```



##### 1.7 函数

规则：简单、易读就好

命名

> 在 PowerShell 中命名函数时，使用包含批准的谓词和单数名词的 [帕斯卡拼写法][] 名称。 我还建议在名词前面加上前缀。 例如：<ApprovedVerb>-<Prefix><SingularNoun>。

获取”谓语“

```powershell
Get-Verb | Sort-Object -Property Verb
```

简单的示例

```powershell
function Get-Version {
    $PSVersionTable.PSVersion
}
```

区域管理

一个窗口一个进程，可以存储一些函数，关闭即失效。

对于这些临时性函数的管理

> 查询：Get-ChildItem -Path Function:\Get-*Version 
>
> 移除：Get-ChildItem -Path Function:\Get-*Version | Remove-Item

参数的使用

```powershell
function Get-MrParameterCount {
    param (
        [string[]]$ParameterName # 参数
    )

    foreach ($Parameter in $ParameterName) {
        $Results = Get-Command -ParameterName $Parameter -ErrorAction SilentlyContinue

        [pscustomobject]@{
            ParameterName = $Parameter
            NumberOfCmdlets = $Results.Count
        }
    }
}

# PS:> 
# Get-MrParameterCount -ParameterName ComputerName, Computer, ServerName, Host, Machine
```

添加 CmdletBinding 以将函数转换为高级函数。

```powershell
function Test-MrCmdletBinding {

    [CmdletBinding()] #<<-- This turns a regular function into an advanced function
    param (
        $ComputerName
    )

    Write-Output $ComputerName

}
<# 使用 Get-Command 来验证是否是高级函数
# 通用参数
> Get-Command -Name Test-MrCmdletBinding -Syntax
# 详细参数
> (Get-Command -Name Test-MrCmdletBinding).Parameters.Keys
#>
```

SupportsShouldProcess 会添加 WhatIf 和 Confirm 参数 。 只有做出更改的命令需要这些参数。

> function functionname { [CmdletBinding(SupportsShouldProcess)] param ( $pass ) $pass }

参数验证

> function functionname { [CmdletBinding()] param ( [string]$pass )$pass }

”管道传参“，注意参数命名规则的数据匹配。

```powershell
function Test-MrPipelineInput {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
                   ValueFromPipelineByPropertyName)]
        [string[]]$ComputerName
    )

    PROCESS {
            Write-Output $ComputerName
    }

}
```

异常处理 : PROCESS / TRY / CATCH

```powershell
function Test-MrErrorHandling {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
                   ValueFromPipeline,
                   ValueFromPipelineByPropertyName)]
        [string[]]$ComputerName
    )

    PROCESS {
        foreach ($Computer in $ComputerName) {
            try {
                Test-WSMan -ComputerName $Computer -ErrorAction Stop
            }
            catch {
                Write-Warning -Message "Unable to connect to Computer: $Computer"
            }
        }
    }

}
```

函数注释

```powershell
function Test-MrErrorHandling {
	<# 注释
	.$pass
	pass code edit
	.Note
	pass
	#>
    param (
 	   $pass
    )
	$pass
}
```

模块脚本

> [函数脚本模板　- PowerShell 101 Docs](https://docs.microsoft.com/zh-cn/powershell/scripting/learn/ps101/10-script-modules )



##### 1.X Note

提示：支持 Tab 键补全

个人使用环境 Windows +

> 版本
>
> - PowerShell 5.0
>
> - PowerShell 7.0
>
> 开发环境 
>
> - PowerShell ISE
>
> - visual studio code
>
> CLI 
>
> - windows terminal
>
> - cmd
>
> - PowerShell



#### 2. 文件管理

大致内容

> 四个字描述本节内容：增、删、改、除

Create

> Get-Help New-Item -Full

Delete

> Get-Help Remove-Item -Full

Modified

> Note：
>
> 貌似没有 Linux 那种 VIM 的插件支持！
>
> 关于文件权限，下一节点会作相关说明。

Remove

> Get-Help Remove-Item -Full

Read

> Get-Help Get-Content -Full

数据过滤

> Remove-Item
>
> New-Item 
>
> New-ItemProperty
>
> Where-Object
>
> Select-Object   
>
> Select-String
>
> Get-Childitem

##### 2.1 示例 # 1、获取 ps1 文件

```powershell
$path = ".\"
Get-ChildItem -Path $path -Force -Recurse | Where-Object {$_.name -like "*.ps1"}
```

##### 2.2 示例 # 2、获取 CPU 使用较高的程序，并输出文件

```powershell
Get-Process | Where-Object {$_.cpu -ge 1000 } | Select-Object cpu,si,id,name > cpu-use.txt
```



#### 3. 权限管理

powershell module

> Get-Acl、Set-Acl、icacls 

icacls 支持备份、还原、删除，效率更好一些。

Get-Acl 再查询方面比较好，可以配合其他 ps 代码混合使用，达到自动化的效果。

Set-Acl 和 Get-Acl 类似

到底哪方式最好呢？不知道！

以你所熟悉的使用方式就好了，比如：

> 1. 导出数据，在其他主机上进行数据过滤；
> 2. ps 过滤数据后，再进一步处理；
> 3. 基于 Windows Export  GUI 操作！（这是最差的情况，它在消耗你的体力）
> 4. 或者有更好的方式，待确认



#### 4. 应用实践与思路

或许它还可以做更多的事情，并且很大程度上支持自动化处理。

列举内容，如下：

##### 4.1 权限报表

> 利用 PowerShell 查询文件服务器的权限继承问题

示例 # 查找 IT 账号在 Windows 文件服务器的权限

```powershell
# 模拟测试
$path-acl = (Get-ChildItem -Recurse -Force | Get-Acl)
$acl_data = $path-acl | Where-Object {$_.AccessToString -like "*txt*"} 
$show_acl = $acl_data | Format-List -Property Path,AccessToString
$show_acl
$show_acl > acl.text
# FileServer
(Get-ChildItem -Recurse -Directory | Get-Acl) | Where-Object {$_.AccessToString -like "*.it*"} |  Format-List -Property Path,AccessToString

# 注：留意处理性能问题
```



##### 4.2 服务检测

> 利用 PowerShell 获取服务器的服务运行状态

示例 # 1、STMP 服务

>命题：服务器的 STMP 是手动开启，如何使用 PowerShell 代码该服务？
>
>我的思路：
>
>1. 检查服务运行状况；
>
>   > Invoke-Command、Get-Service
>
>2. 根据服务的准状态进行区分处理；
>
>   > Get-Service、Start-Service、Invoke-Command、、Get-Credential、New-PSSession
>
>3. 结束，返回服务运行状况；
>
>   > Invoke-Command、Get-Service



##### 4.3 信息收集

> 利用以上两点的思维，获取服务器的信息。

示例 # 1

```powershell
# 1.获取打印机服务
Invoke-Command -ComputerName dc-drk, dc-hoqui {Stop-Service -Name Spooler } -Credential $Cead 
# 2.获取服务器的服务运行状况
Invoke-Command -ComputerName dc-drk, dc-hoqui {Get-Service -Name Win32Time } -Credential $Cead
```

Invoke-Command 的作用，发送数据到服务器，执行该数据并返回结果。

加入不使用该命令，连接方式：1.持久连接、2.临时连接，此命令是属于临时连接，且优势在于支持多服务器批处理。



##### 4.4 查看日志

> 利用 PowerShell 命令查询服务器的日志

没有文档的情况下？该如何呢？

>1. Get-Command -Name "*Event*"
>
>   查找与事件相关的命令	
>
>2. Get-Help -Name "*Cmdlet*" -Full
>
>   获得相关 Cmdlet 的详细帮助
>
>3. "Cmdlet"
>
>   具体操作

有网络和浏览器，并且还开发的情况下，可额外借助

> 1. 借助上面的思路
>
> 2. 或者 搜索引擎：PowerShell + Cmdlet 
>
>    > site Microsoft （指定网站 - 微软）
>
> 3. 或者 第三网站文档
>
> 4. 或者 工具图书

Note

只记录一些“思路”相关的文笔，以个人目前的 PowerShell 技术水平为基准（个人人为为基础型）



#### X. Appendix

##### **Flows** 

1. 假设你很懒，不关心 PS 的技术，直接使用 4.1 的内容，你就可以获得相关的结果；

2. 在意本文的内容，并且有意了解 PS，查阅流程如下：

   > 1.2  - 1.3 - 1.6 - 2 - 3 - 4.1

3. 想获得更全面 PS 的知识，请浏览 PowerShell 101 然后再回来看本文作为参考，根据自己的知识水平写出更好 PS 代码质量。这样既有利于自己的技术水平、也能够更好的应付其他的方面的问题。

##### **Reference**

1. PowerShell
   
   [PowerShell文件系统（一）前言](https://www.pstips.net/the-file-system.html)
   [PowerShell文件系统（二）访问文件和目录](https://www.pstips.net/accessing-files-and-directories.html)
   [PowerShell文件系统（三）导航文件系统](https://www.pstips.net/navigating-the-file-system.html)
   [PowerShell文件系统（四）使用目录和文件工作](https://www.pstips.net/working-with-files-and-directories.html)
   [PowerShell文件系统（五）管理访问权限](https://www.pstips.net/managing-access-permissions.html)
   
2. Microsoft Docs

   [PowerShell 连接服务器](https://docs.microsoft.com/zh-cn/powershell/scripting/learn/remoting/running-remote-commands)

   [PowerShell 远程处理](https://docs.microsoft.com/zh-cn/powershell/scripting/learn/ps101/08-powershell-remoting)

   [PowerShell 101 ( 目前官方的初级指导手册 )](https://docs.microsoft.com/zh-cn/powershell/scripting/learn/ps101/00-introduction)
   
   [什么是 PowerShell ？ ](https://docs.microsoft.com/zh-cn/powershell/scripting/overview)
   
   [Windows Management Framework](https://docs.microsoft.com/zh-cn/powershell/scripting/windows-powershell/wmf/overview)
   
   [Windows Management Instrumentation（WMI）](https://docs.microsoft.com/en-us/windows/win32/wmisdk/wmi-start-page)
   
   [c-- batch command](https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/icacls)
   
3. Blog
   
   [WMI 的攻击，防御与取证分析技术之攻击篇- Her0in](https://wooyun.js.org/drops/WMI 的攻击，防御与取证分析技术之攻击篇.html)
   
   [非 Windows Server 开启 WinRM - Blog](http://www.suoniao.com/article/31853)
   
4. Wikipedia

   [Windows 管理规范（WMI）](https://zh.wikipedia.org/wiki/Windows%E7%AE%A1%E7%90%86%E8%A7%84%E8%8C%83)

   

   

