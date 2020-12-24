#### Portable Programs Deployment And Migration | 便捷版程序部署与迁移

**简述**

在不能够使用 AD 进行软件管理的情况下，对软件进行部署、管理和维护（仅针对便捷版程序）。

以传统的管理方式只会增加人力资源的成本，而且不能使用 AD 域对客户端进行管理，所以本文的脚本化已经把安装和卸载都思考在内了，这是我目前的最优解。或许还有其他的软件和平台，或者服务，本文的差异在于自主实现相关内容，解放 IT 管理员的双手，去做更多需要攻克技术难度、花费更多时间应用技术的事情上。



##### 1. 脚本化可能性

便携程序来源：1. 自制（此处省略了很多内容，不推荐此方式！）；2. 第三方提供；

>  注意：注意软件的来源的可靠性和安全性；

数据包格式：

> 基于树结构，然后制作一个快捷方式的文件夹，将其内容复制到相关的用户程序启动参数或文件夹即可；

部署方式：1.  个人；2. 系统；

> - 路径
>
> 个人：%localappdata%\DATA\Portable
>
> 系统：%SystemDrive%\Portable
>
> - Program 菜单
>
> 个人：%appdata%\Microsoft\Windows\Start Menu\Programs
>
> 系统：%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp

用现有的技术实现：

> 1. 数据包
>
>    7zip、或者单一的文件夹；
>
>    借助文件服务器；
>
> 2. PowerShell、Batch
>
>    element：复制、覆盖、创建；



##### 2. 测试与应用

示例：基于 batch 部署 Firefox Portable

基础

注意：请提前下载好保证其软件是安全的便捷版程序。

实现代码

```powershell
@echo off
@REM 1.Install: Firefox_and_outlook_Web.bat
set filepath="\\fab-112\Temp\_edge\FirefoxPortable\FirefoxPortable"
set likpath="\\fab-112\Temp\_edge\Outlook Web 客户端.lnk"
set software_path="C:\.phd.software\FirefoxPortable\"
set desktop="C:\Users\Public\Desktop\"
xcopy %filepath% %software_path% /s /e /j /y /z
xcopy %likpath% %desktop% 

@REM 2.Remove
@REM rmdir %software_path% /s /q
@REM rmdir %desktop% /s /q
```

快捷方式

```markdown
1. 创建快捷方式；
2. 输入以下内容；
> C:\.phd.software\FirefoxPortable\App\Firefox\firefox.exe https://outlook.office.com
3. 重命名为：Outlook Web 客户端
4. 保存至：%SystemDrive%\user\public\desktop\;
5. 或者保存至服务器进行统一的部署；
```

开始部署

> 1. 客户端访问服务端主机，直接运行 batch 脚本：Firefox_and_outlook_Web.bat；
> 2. 等待下载内容完成后保留副本至客户端；
> 3. 适用管理员账号，将快捷方式保存至相关的位置；
> 4. 打开快捷方式，测试本次部署是否成功；

后期维护

> 卸载程序
>
> 1. 修改本地副本的 batch 脚本代码，然后执行；
> 2. 或者直接删除该文件；



##### Appendix

**Code**

批量处理

```powershell
# REM Portable-Programs-Manage.ps1
# 部署
# portable-path
$pf_path = ".\Portable"
$lnk_path = ".\Portable\lnk"
$systemfile_path = "%SystemDrive%\Portable" # 系统存储路径
$userprofile_path = "%localappdata%\DATA\Portable" # 用户文件存储路径
# $desktop = "C:\Users\Public\Desktop\Outlook Web 客户端.lnk"
# Lnk-path
$user_lnk = "%appdata%\Microsoft\Windows\Start Menu\Programs\" # 用户快捷方式
$system_lnk = "%ProgramData%\Microsoft\Windows\Start Menu\Programs\" # 系统快捷方式
Copy-Item -Path $pf_path -Destination $userprofile_path -Recurse
Copy-Item -Path $lnk_path -Destination $user_lnk -Recurse

<# Attachment 1.Remove Portable Program
# 移除
# Remove-Portable
$user_lnk = "%appdata%\Microsoft\Windows\Start Menu\Programs\" # 用户快捷方式
$userprofile_path = "%localappdata%\DATA\Portable" # 用户文件存储路径
Remove-Item -Path $software_path
Remove-Item -Path $desktop
#>

<# 打包 ( 基于 7zip )
# to-7zip-package
# docs: https://sevenzip.osdn.jp/chm/cmdline/commands/add.htm
$date = Get-Date -Format "yyyy-MM-dd"
& 'C:\Program Files\7-Zip\7z.exe' a Package_$date.7z .\*
#>

<# 其他方式
# attch: batch-command
xcpoy /?
copy /?
#>
```

**Reference**

> 1. [Windows 自启设定 - blog](https://huchengv5.github.io/post/%E5%A6%82%E4%BD%95%E6%B7%BB%E5%8A%A0%E5%88%B0%E5%BC%80%E6%9C%BA%E8%87%AA%E5%90%AF%E5%8A%A8.html)
> 2. [usmt-recognized-environment-variables](https://docs.microsoft.com/en-us/windows/deployment/usmt/usmt-recognized-environment-variables)
> 3. [getting-started-storing-app-data-locally](https://blogs.windows.com/windowsdeveloper/2016/05/10/getting-started-storing-app-data-locally/)