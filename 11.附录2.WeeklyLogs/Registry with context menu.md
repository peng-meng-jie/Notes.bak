#### Registry with context menu

概览

重复的工作应该由计算机负责，把功能增加到最为常用之一的鼠标右键上，提高用户效率。

用途：

嵌套 PowerShell 执行自动备份程序；

重复的动作单个按钮即可解决，节约重复的人力成本；

去除繁复的操作，封装和隐藏相关的操作，开启 “ERP 信息化”模式，用户只需关注其结果而无需二外的学习成本；



#### 1. 基础：增加自定义鼠标右键

提醒：注册表会涉及到系统的底层，请熟悉和了解对注册表的备份与还原；

全局配置，点击鼠标即可使用

> Computer\HKEY_CLASSES_ROOT\*\shell\VSCode\command
>
> Computer\HKEY_CLASSES_ROOT\*\shell

指定配置，以 EXE 文件为例

> 寻找 .exe 后缀的参数
>
> Computer\HKEY_CLASSES_ROOT\.exe\ (Default) in data
>
> 得知名称为 exefile
>
> Computer\HKEY_CLASSES_ROOT\exefile\shell



#### 2. 进阶：嵌套脚本

基于第一点的全局鼠标设定，使用 shell 命令中引导使用本地脚本，即可实现自动化处理；

与 GPO 集成还可以集中管理和推送；

##### 2.1 嵌套脚本

1. 自建脚本库，并涉及系统变量；

   自建：1.C 盘自建文件，用于存放文件；2.将其加入系统环境变量；

   或使用系统自带的都可以；

   Note：软连接、硬链接、网络链接都可以，在保证其可以稳定运行即可。

2. 增加注册表

   - Computer\HKEY_CLASSES_ROOT\*\shell\MoveDesktopFileToDdisk

   - add commod
   - Link Powershell ：powershell -file %path%\powershell_movefile.ps1

   ```powershell
   # Move Desktop File To D disk
   # 备份桌面文件至 D 盘
   Move-Item -Path %userprofile%\Desktop -Destination D:\BACKUP
   ```

##### 2.2 集成至 GPO 管理

集群管理

- 后台开发与测试

   IT 负责开发与测试，确保其可用性；合理利用 Poweshell 、Batch 命令；

- GPO 推送：脚本库、变量、注册表

  由后台统一管理脚本库、设定系统变量、修改注册表；

- 后期管理

  重复以上两个步骤，发布新的功能，或者管理该功能；

  

#### 3. 假设

- 当前用户对于 Word 使用频率极高，期间可能回造成一些文档损坏，在后台做一个鼠标右键修复 Word 文档；
- 逆向思维，把多余的鼠标右键选项删除；



#### Appendix

##### Note

PS：由于时间和成本的缘故，步骤方面很简陋，不详细，要求使用者对该本文的知识有一定的了解，如下：

Element（Windows）：注册表、GPOM、AD、系统变量、Poweshell、Windows Batch、文件链接；

##### Reference

1. Microsoft Docs

   [Registry Reference](https://docs.microsoft.com/en-us/windows/win32/sysinfo/registry-reference)

   [Registry](https://docs.microsoft.com/en-us/windows/win32/sysinfo/registry)

   [how-to-back-up-and-restore-the-registry-in-windows](https://support.microsoft.com/zh-cn/help/322756/how-to-back-up-and-restore-the-registry-in-windows)

   [windows-registry-information-for-advanced-users](https://support.microsoft.com/zh-cn/help/256986/windows-registry-information-for-advanced-users)

2. [巧用注册表和命令行，把鼠标右键打造成你的专属工具箱](https://sspai.com/post/61098)

3. [通过注册表删除 Windows 系统右键菜单多余项](https://www.onlyzyx.com/00020.html)

4. [Windows 10 自定义右键菜单-修改注册表](https://blog.csdn.net/CrowNAir/article/details/78128566)

5. [注册表 -- Wikipedia](https://zh.wikipedia.org/wiki/注册表)

   