# PowerShell 数据传输与完整性检查

手动的操作重复繁杂，在现有且不可随意变更原有环境的情况下，简化流程，提高执行效率；

[TOC]

## 1. 信息评估

基本环境，主要使用 Windows 系统，版本分为 7、10。主要的问题在于只能在原有的基础上扩展，不能随意添加“软件”或第三方的工具。其次考虑可实现的方案，现有的基础如何改进流程的进步？需要注意那一些特点，以此不会使自动化流程过于偏离原有的“规矩”。如何跨版本，向下兼容？

### 1.1 方案预设

统计目标信息，路径、流程、涉及模块、可能性；

测试：网络传输、网络凭证、兼容性测试、代码测试、缺陷评估；

投入使用与维护；

### 1.2 运行环境

| 项目         | Windows 7       | Windows 10      |
| ------------ | --------------- | --------------- |
| CLI          | cmd.exe         | cmd.exe         |
| Power Shell  | power shell 2.0 | power shell 5.0 |
| 网络存储平台 | NAS             | NAS             |

由此可知现有的基础有 cmd.exe 、powershell ，其中 cmd.exe 成长已经停歇有很多功能都不能很好的去利用，特别是在脚本化时存在一些缺陷，比如不能自动获取日期。powershell 就没有这种问题，完全就是一个为脚本而生的语言，在微软的支持下能够真正称为 powershell 在于第 7 版的发布。基于它发展的迅速特点，所以它也存在一些问题，兼容性问题。好在于有健全的文档可以参阅，在脚本化和测试中有很大的优势；

### 1.3 Workflow

传统流程

> 1.登录、顺序打开、临时创建、网络文件传输）
>
> 2.文件数量及大小比对；

信息化后的流程

>  1.登录，保持凭证或其他
>
>  2.自动化流程：打开、创建、传输；
>
>  3.数据统计：完整性（数量和大小）



## 2. 脚本测试

示例一、Windows 10 powershell 5.0

```powershell
# backup data windown10 version (powershell 5.0)
# 对于无法运行的设备，请使用管理开启权限，如下：
# Set-ExecutionPolicy RemoteSigned
# - copy
$Todays = Get-Date -Format "yyyyMMdd"
$local_data = "D:\IR DATA"
$local_audit = ""
$nas_path_1 = "\\nasfab01\LAB DATA BACKUP\Manual backup project\$Todays\L243" 
Copy-Item -Path $local_file -Destination $nas_path_1 -Recurse
Copy-Item -Path $local_audit -Destination $nas_path_1 -Recurse 
# - Compare
$data_local_folder = Get-ChildItem -Path $local_data -Force -Recurse
$data_nas_folder = Get-ChildItem -Path $nas_path_1 -Force -Recurse
Compare-Object -ReferenceObject $data_local_folder -DifferenceObject $data_nas_folder
# - folder
$size_local = (Get-ChildItem -Path $local_data  -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
$count_local = Get-ChildItem -Path $local_data  -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object | Select-Object -ExpandProperty Count
$size_cloud = (Get-ChildItem -Path $nas_path_1  -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
$count_cloud = Get-ChildItem -Path $nas_path_1  -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object | Select-Object -ExpandProperty Count
"Local Folder Size: {0:n2} MB" -f ($size_local/1MB)
"Local Number of files: $count_local"
"Cloud Folder Size: {0:n2} MB" -f ($size_cloud/1MB)
"Cloud Number of files: $count_cloud"
```

示例二、Windows 7 powershell 2.0

```powershell
# title: backup DR-audit from windown7-powershell-2.0
# Notes: Runas Administrator for PowerShell：Set-ExecutionPolicy RemoteSigned
# Cloud-PATH：\\nasfab01\LAB DATA BACKUP\Dissolution\<ID>\System activity\$Todays\SCM_backup

$Todays = Get-Date -Format "yyyyMMdd"
$folder_local = "D:\SCM_backup"
$folder_cloud = "\\nasfab01\LAB DATA BACKUP\Dissolution\<ID>\System activity\$Todays\SCM_backup"
Write-Host "run backup"
Copy-Item -Path $folder_local -Destination $folder_cloud -Recurse

$folder_local_2 = Get-ChildItem -Path $folder_local -Force -Recurse
$folder_cloud_2 = Get-ChildItem -Path $folder_cloud -Force -Recurse
Write-Host "check dr-date tree"
Compare-Object -ReferenceObject $folder_local_2 -DifferenceObject $folder_cloud_2
```

## 3. 已知问题

已知问题：文件覆盖、无异常处理、首次使用无法运行；

1. 文件覆盖，如果执行重复的操作会造成和额外的文件产生，copy-item 默认不会覆盖目标数据；
2. 无异常处理，如果其中出现差错的意外有可能无法避免，人工符合很重要；
3. 首次使用无法运行，管理员运行 Set-ExecutionPolicy RemoteSigned ，注销后再登录即可；

Notes：已知的问题就是可以改进的方向，但并不影响目前的使用，要求使用者了解其中的内容和缺陷。可以让你遇到问题时不必造成额外的负担；

## Attachment

element

网络凭证、数据统计与分析、文件传输、基础系统架构；

Reference

1. [Microsoft PowerShell Docs](https://docs.microsoft.com/en-us/powershell/module/)

   Module ：Get-date、Get-ChildItem、Compare-object、Copy-Item、Measure-Object、Select-Object；

2. Blog

   [powershell 统计-文件夹大小](https://blog.vichamp.com/2017/09/26/calculating-folder-file-size/)

   [powershell 统计-文件数量](https://blog.vichamp.com/2017/09/25/counting-files-efficiently-part-2/)

   

   





