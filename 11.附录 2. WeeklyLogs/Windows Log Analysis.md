# Windows Log Analysis

使用系统：Windows 10 , 用于分析设备的运行情况以便排查问题

## 1. Log Files

注意：他们一般是以隐藏的方式存在

文件路径及相关解析 ( C:/Windows/Panther ) 

> 请查阅:  Microsoft 官方文档对 一部分的 Log File 的解析 :  [Link](https://docs.microsoft.com/zh-cn/windows/deployment/upgrade/log-files)

日志文件的结构

| 日期 / 时间         | 日志类别 | 组件 | 消息         |
| ------------------- | -------- | ---- | ------------ |
| 2020/03/19 11:13:00 | Error    | MIG  | 文件无法打开 |

**简单分析示例**

有助分析异常的信息

​	时间 / 错误代码 / 与系统相关的信息 / 微软提供的错误代码方案等

1.确定你的错误代码, 记录下来 (这很重要)

2.查阅其的详细信息, 确认你要查询日志类型和位置 (可有效减低排查曲线)

3.进入 (C:/Windows/Panther) Log 文件的路径, 使用一个记事本 (或 Visual studio code) 打开

4.查询最新的 Log 信息请拉动至滚动鼠标到文档的底部, 使用 Find 辅助查询

5.当你发现了问提的存在，请检索上下文，寻找相应的错误流程 / 错误详细提示

6.根据错误的代码，问题发生的根源

7.查阅现有的解决方案，Microsoft、Google、Baidu等

## 2. Event Views

它的优势：图形操作，可筛选，自带分类

1.Win+R：control，选择管理工具，再选择“事件管理器"

2.点击”window log“，此分类下有：五个子分类，需要注意的是。应用程序和系统

3.点击需要查询的项目，右边方”操作“栏，筛选、查找、另存为等

4.查看错误信息的ID，根据ID查找相应的方法；

## #附录

1.[log-files	--Microsfot](https://docs.microsoft.com/zh-cn/windows/deployment/upgrade/log-files)

2.[windows-error-reporting	--Microsfot](https://docs.microsoft.com/zh-cn/windows/deployment/upgrade/windows-error-reporting)

3.[Win32 Error Codes		--Microsfot](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-erref/18d8fbe8-a967-4f1c-ae50-99ca8e491d2d?redirectedfrom=MSDN)