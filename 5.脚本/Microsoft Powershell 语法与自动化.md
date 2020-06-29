### Microsoft Powershell 语法与自动化

合理的使用工具，可以提高工作的效率，Powershell 自动化处理就是一种方式。

powershell or bat + Windows 任务排程可以到达自动化处理业务，当然他还是

PS: 因为某些原因（安全或其他），python 不可以直接调用 Powershell 程序，相比 linux 就显得大气大度许多。

##### 1. 语法

了解一个新编程语言就从它的「语法、数据结构」开始，它常常能表现出与其他编程语言的区别和特性，以及设计的哲学性和面向业务。

包括不限于（此处只列举”基础“部分）：变量、操作符、逻辑符、运算符、选择句、面向对象、数据结构、异常处理；

###### 1.1 了解 PowerShell

Powershell 和 LInux shell 、Python Scripts 存在操作和兼容性的差异，且特性不同。

> 生命周期 ：[PowerShell 支持生命周期](https://docs.microsoft.com/zh-cn/powershell/scripting/powershell-support-lifecycle?view=powershell-7)
>
> 其概念 ：[什么是 PowerShell ？](https://docs.microsoft.com/zh-cn/powershell/scripting/overview?view=powershell-7) 
>
> 命名规则：副词+名词，比如 Get-Objects、Get-Help

###### 1.2 基础语法

官方文档中并没有写出相关的语法结构，这里引用第三方的语法总结。

```powershell
REM # 变量、对象、数据结构

REM ## 变量
REM 变量
$v	REM 强类型（自动存储），不区分大小写。另外还有：自动变量、环境变量
REM ## 对象
<#
REM Powershell 是基于对象的；
New-Objcet 可创建对象;
Add-Member 可添加属性和方法;
#>
REM ## 数据结构
$v = @[]	REM 建立
$v.Count	REM 
$v[N]	REM 
$.clone() REM 

REM # 控制流
<# 
# 比较运算符
-eq	等于
-ne	不等于
-gt	大于
-ge	大于等于
-le	小于等于
-lt	小于
-contains	包含
-notcontains	不包含
# 布尔运算
-and	和
-or		或
-xor	异/或
-not	逆
# 循环
while / while($n -gt 0) { code } /
for / for($i=1; $1 -gt 100; i++) { code } /
foreach / foreach ($n in $array) { echo $n / other_code  } / 
if / if (数值比较)
switch / switch ($number) { {$number_1 -le 50} {"test_1"} {$number_2 -eq 50} {"test_2"}  } /
do / do { $num /code} } while($sum -gt 15)
Notes: break 则是跳出该循环。
#>

REM # 函数
functions FuncName(args[]) { code }

REM # 错误处理
try { FuncName } catch { Failed Missage }

```

##### 2. 自动化

自动化思路： Powershell 自动化处理和 Windows 定时任务。

定时任务不在此文章讨论范围，另外还可设计成为交互式从而实现更好的自动化处理。

**示例**

```powershell
REM ### 获取局域网 Windows Host Update，不靠谱的脚本 ###
REM 缺点：目标主机处理开机、或关闭防火墙的条件下
REM 此处以里水厂的主机 IP 为基础，使用 Powershell 运行（需要管理员权限）
<#
1.创建一个数组变量、常用变量
2.基于数组创建’ IP 地址池‘，本脚本使用为 192.168.33.0/24
3.基于现有的语法 Get-hotfix -computername [PC/IP]
4.循环处理 Get-hotfix 并保存到变量中
5.导出到本地
#>
$ip_list = New-Object System.Collections.ArrayList

for ($i=1 ; $i -le 255; $i++ )
{
    $name = "192.168.33."
    $name_add = $name + $i
    $ip_list.Add($name_add)
}

$HotFix_FAB = New-Object System.Collections.ArrayList

foreach ($ipname in $ip_list)
{
    $ipname
    REM $ipname_log = $ipname + ".LOG"
    REM Get-HotFix -ComputerName $ipname > $ipname_log
    $FAB = Get-HotFix -ComputerName $ipname
    $HotFix_FAB.Add($FAB)
}

$HotFix_FAB > FAB-Hotfix-IP.txt
```

##### 3. 补充：Batch File、DOS

微软 CLI 产品的前辈（cmd/bat）用于处理部分重复的任务，以 bat 为后缀。常见的应用环境为 Windows 7，而且目前得趋势是 powershell 取代 cmd/bat。此条目为了特殊情况和特例的参考而编写。

###### 3.1 基础知识

> **批处理（Batch File）**
>
> > echo
> > rem
> > pause
> > call
> > start
> > goto
> > set
>
> **符号**
>
> > 回显屏蔽 @
> > 重定向 1 >与>>
> > 重定向 2 <
> > 管道符号 |
> > 转义符 ^
> > 逻辑命令符包括：&、&&、||
>
> **DOS 命令**
>
> 来自于 IBM 的技术，于 2000 年停止开发，但是其还嵌套再 Windows 7/8/10 中。最常应用于 Win 7。
>
> > **文件夹管理**
> >
> > cd 显示当前目录名或改变当前目录。
> > md 创建目录。
> > rd 删除一个目录。
> > dir 显示目录中的文件和子目录列表。
> > tree 以图形显示驱动器或路径的文件夹结构。
> > path 为可执行文件显示或设置一个搜索路径。
> > xcopy 复制文件和目录树。
> > **文件管理**
> >
> > type 显示文本文件的内容。
> > copy 将一份或多份文件复制到另一个位置。
> > del 删除一个或数个文件。
> > move 移动文件并重命名文件和目录。(Windows XP Home Edition 中没有)
> > ren 重命名文件。
> > replace 替换文件。
> > attrib 显示或更改文件属性。
> > find 搜索字符串。
> > fc 比较两个文件或两个文件集并显示它们之间的不同
> > 网络命令
> >
> > ping 进行网络连接测试、名称解析
> > ftp 文件传输
> > net 网络命令集及用户管理
> > telnet 远程登陆
> > ipconfig 显示、修改 TCP/IP 设置
> > msg 给用户发送消息
> > arp 显示、修改局域网的 IP 地址 - 物理地址映射列表
> > **系统管理**
> >
> > at 安排在特定日期和时间运行命令和程序
> > shutdown 立即或定时关机或重启
> > tskill 结束进程
> > taskkill 结束进程(比 tskill 高级，但 WinXPHome 版中无该命令)
> > tasklist 显示进程列表(Windows XP Home Edition 中没有)
> > sc 系统服务设置与控制
> > reg 注册表控制台工具
> > powercfg 控制系统上的电源设置

###### 3.2 示例

> 参考连接 [Windows 批处理(cmd/bat) 常用命令小结 -- Blog](https://wsgzao.github.io/post/windows-batch/) #  Windows Batch 常用命令

#### 附录

1. [PowerShell -- Microsoft Docs](https://docs.microsoft.com/zh-cn/powershell)
2. [PowerShell 语法总结 -- Blog](https://bbkali.github.io/2020/01/27/powershell语法总结/)
3. [PowerShell 基础总结 -- Blog](http://1sparrow.com/2018/07/05/PowerShell 基础总结/)
4. [Powershell 4.0 在线教程(旧版)](https://www.pstips.net/)
5. [Windows 批处理(cmd/bat) 常用命令小结 -- Blog](https://wsgzao.github.io/post/windows-batch/)
6. [编写批处理文件 -- wikihow](https://zh.wikihow.com/编写批处理文件)
7. [批处理总结与分享（适用于 Win XP）-- CSDN](https://blog.csdn.net/z22050519/article/details/17019137)

