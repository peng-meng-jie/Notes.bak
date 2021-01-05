##### 2020.12.31 Note

突发奇想，想记录故障率和处理过程，然后复盘并将其的效率拉到最高。然后就可以专心的去发现和应用新的计算机科学技术了，美滋滋。

> 区间 2020.10 ~ 2020.12

本来并没什么问题的将其发展下去，但是由于职务的问题和职场的问题需要处理，搁浅了许多的内容和过程。所以希望明年会更好把。

目前的有记录，但没有分析的副本在 Microsoft To-do



#### Fault Analysis I 故障分析

> 注：简化其中的流程，只注重用户需求、故障分析和处理，以及报告再分析

**Event STATUS**

>  -C [ Close // 结束 ] -F [失败 // Failure] -A [遗弃 // Abandon]

**Event TAG**

> -r[ Requirement // 需求 ] -a [ Analysis // 分析] -m [ Manage // 处理]



[TOC]

#### 2020 December 

##### X # Report

##### 1.PDF Error	#	-S -C

r，无法打开 PDF 文档

a，外网正常，自动更新补丁后异常 ！（推测，补丁异常）

m，1.更新版本后解决；2.AD 推送软件或许更好哦 ！



#### 2020 November

##### X # Report

被压榨了，取消总结



##### 20. Win 10 无法打开图片文件	#	-P

r，无法打开 jpg shell  文件

a，其他程序，正常；图片程序无法打开；

m，重置图片程序后正常



##### 19. Login Profile	#	-P

m，1. 手动清除 User Profile

m，2. 自动清理，暂未测试



##### 18. Blue Screen	#	-P -A

r，接入键盘异常，触发蓝屏

a，

引用方法：

> 1. 运行内存诊断程序。请参阅本文底部的PSA/ePSA链接。
> 2. 更新芯片组、显卡、显示器和网络适配器驱动程序。
> 3. 验证任何新硬件或软件是否安装正确。断开或更换新硬件，查看能否解决此问题。
> 4. 在BIOS中禁用内存高速缓存
> 5. 从戴尔支持网站的[Drivers & Downloads](https://www.dell.com/support/home?app=drivers)（驱动程序和下载）部分更新驱动程序和固件。

m，因本计算机应用环境特殊，切换键盘后无异常，不作追踪处理。



##### 17. Word VBA Error	#	-S -C

r，无法打印

a，

错误文件，pass

VBA 脚本兼容性？ WPS to Microsoft Office，ok

m，转换格式 WPS to Microsoft Office



##### 16. Use AP Exchange Not Get ip ？	#	-P

r，收集路由和相关的 ip 信息；查询相关的技术；查询官方的固件说明；

a，待分析

>1. Route and Control Logs
>
>最具价值的信息，如下的：event_type":"soft failure"
>
>```markdown
>Tue Nov 17 16:03:08 2020 user.info : stahtd[3242]: [STA-TRACKER].stahtd_dump_event(): {"message_type":"STA_ASSOC_TRACKER","vap":"ath0","mac":"7c:2a:db:42:7e:22","event_type":"soft failure","assoc_status":"0","ip_assign_type":"roamed","auth_ts":"7952018.498994","auth_delta":"0","assoc_delta":"10000","event_id":"2"}
>
>```
>
>Note：无法获取相关信息，下一步 Debug DHCP 
>
>2. Debug DHCP ：DHCP timeout/failure
>
>

m，



##### 15. Excel Print Error	#	-P -P -S -C 

r，无法打印

a，1.重置 office#pass；2.打印驱动#pass；3.关闭程序#good

m，1.关闭 Windows Service；2.增加虚拟内存；



##### 14. Word Table is Error	#	-P -S -C

r，表格异常

a，1.选框排查-失败；表格重置-失败；文字重置-可以了；

m，关闭文字环绕 - 表格重置 - 重新排版 - OK



##### 13. 扫描质量差异	#	-P

r，黑白、灰度、彩色的大小占比与质量

a，

标准 ：文件 PPI 与质量和大小

基础数据收集：已收集

计量公式，待操作

m，





##### 12. 键盘无法操作	#	-S -C

r，生产任务中，键盘无法操作

a，软件卡顿、鼠标信号无反应

m，重置无线信号信息，重试操作



##### 11. 扫描收件缓慢	#	-P	-C

r，扫描邮件收件很慢

a，分析日志：PRINT and STMP Server；VPN + 异地 SMTP 服务器导致响应缓慢；

m，更换服务器的最优 DNS 路径



##### 10. Excel 外部文件异常	#	-S -C

r，无法打开相关”外部 Office 文件“

a，Office 不受信任的文件

m，关闭信任中心保护 ！，并建议用户谨慎操作！



##### 9. Print Scan Error	#	-P -S -C

r，请解决扫描异常、异常的错误提示

a + m，

扫描，已完成

>  扫描问题为 SMTP 服务器，VPN 网络缓慢！导致收件时间有误。
>
> 操作：更改为里水的服务器

异常错误提示

> 根据错误代码提示为查询得知，传感器问题。
>
> 但是该设备已经过了保修期，不在维护范围以内，且维护需要二外收费。
>
> 操作：建议用户，将就用着先。



##### 8. Fix Error Windows Server Code	#	-P

r，修复服务器的异常错误代码

a，待分析

> 1. GPO 应用异常，IT 账号不注销 ！！！
> 2. DC02：Login Scripts 异常
> 3. 以及其他重要的问题

m，



##### 7. Outlook 打开卡顿	#	-A -C

r，打开邮件，然后卡顿，很困扰

a，userprofile、加载项、计算机性能，谋一份邮件造成卡顿，计算机性能无法处理！

m，硬件升级不可能，建议改进用户使用方式



##### 6. Excel （自动的）频繁乱码	#	-S -P

r，Excel 频繁乱码，自动重复编码

a，单个应用格式异常【用户已执行，无效】，模板应用格式异常，【待反馈】

m，套用全局格式模板，待观察和反馈



##### 5. 网页服务无法使用	#	-A -C

r，局域网主机，用不了网络翻译功能，请协助修复。

a，HTTPS 抓包结果为，服务器返回 http.405 （拒绝链接）

m，更换同类型产品，或者选择更稳定的来源，比如 Google 翻译



##### 4. Outlook Folder Name Error 	#	-A -C

r，最好让它显示为中文

a，问题：服务端信息“异常”。根据官方建议，重置客户端信息【无效】、配置服务端信息【无管理员权限】*2

m，无权管理，不对此部分负责和提供技术支持



##### 3. Desktop 无法操作，需要重启	#	-P -P

r，修复异常的启动后无法操作 desktop 的问题

a，抓取 Logs 待分析原因

> 根据抓包信息，无异常，可能是常规的信息如下 11.03 ：
>
> 1. 自启服务正常，360
> 2. Outlook 启动正常
> 3. 软件无异常，错误报告无。
>
> 扩大范围
>
> 1. 基于广义的搜索范围确认，问题在于快速启动的异常。

m，关闭快速启动，或者修复异常的 Windows 文件。



##### 2. 用户凭证更新	#	-C

r，更新用户凭证

a，同步凭证，IT 协助处理（原本就可以忽略该动作）

m，IT 协助同步更新



##### 1. Word 显示异常 	#	-C

r，修复异常的下载显示文件；

a，初步确认为文本显示；现场确认为字符显示问题；

m，关闭特殊符号显示即可



#### 2020 October

##### X. -A # Report

主要问题：IT 设备日常维护、网络故障；

解决方案：

1.普及 IT 信息化信息，比如 Microsoft Teams、Umeeting 等待专用办公室的软件和服务；

2.宣传简单的故障修复功能，IT 负责开发相关的模块，用户在此基础上进行操作，“自行处理故障”；



##### 3. Network Error	#	-C

r，恢复网络

a，本地网卡、局域网、广域网；

m，本地网卡连接失败



##### 2. Meeting # 管理	#	-C

Daily / One

r，线上会议架设

a，日常管理，针对设备和账号

m，每一次会议开始时，均需要重复此步骤



##### 1. PRINT # 维护 	#	-C 

+1

r，修复设备

a，根据错误代码，置换或清理：卡纸和配件

m，置换和清理



#### Appendix

Logs

>  add date 2020.10.29



 