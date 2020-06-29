# Python 3 automated script

编程语言以 Python 为例，其他编程语言可作为参考

[TOC]

## 1. 基础

了解一个高级程序就从它的基础开始，但由于此处不做记录。重点转移至“高级语言特性”，也就是各个高级程序语言的特点和优势，以及它所处领域的优势，它的多样化体现之处。

**涉及的计算机基础**

首先计算机组成、原理已在其他文章中有所笔记和记录，此处不再做重复阐述，这是一个有关底层硬件和底层软件的讨论，而 Python 则刚好建立在它们的基础之上面向类似于网络中的”应用层“。其次汇编、编译原理、内存、反编译。所以这些均不在此笔记范围，也不是我的强项，Python 给我更大的感觉是服务而不是性能，只需了解缺点和应用特性。

**高级程序语言**

> 建议：对与已经熟练一名编程语言，想要扩展请参阅 [Learn Python Docs](https://learnxinyminutes.com/docs/python/) 快速阅览，用于复习也是一个不错的选择。
>
> Note：参阅”编程泛型“文章可以对高级编程语言有更好的了解。

**运行环境**

现代化的发展，你可以一键安装、自主编译、改进源代码等等，对它进行自定化使用和开发。对于迁移性可以使用虚拟环境，包管理可以使用 PIP，这都是一把尖锐的利器。

**常量、变量与内置数据结构，包含着数据传输和存储**

简述常量于变量的关系，额外补充内置的数据结构；

常量

固定的数据结构，在运行起着预判的作用，固定的关键信息很重要，当然也可以变更。

变量

随着运行的状态变化而变化，通常存储于内存之中，用于处理数据。运行中会出现传值”异常“的操作，这不是常识只是该语言设计上存在的一些缺陷，注意即可。

> 参阅 「流畅的 Python」赋值操作符的信息

**内置数据结构**

list，列表。可任意的存储数据，可以演进为”一棵树“的数据结构，支持位移、切片、加减、叠加等。

dirt，字典。”键-值“数据

tuple，元组 ？？？

set，集合。相似于列表，但是其存储的数据具有唯一性，不能重复。

> Pending 2020/06、28，以了解为基础（目标）还是没什么动力啊。
>
> 逻辑操作
>
> 循环与选择
>
> 循环
>
> 选择
>
> 运算符与操作符
>
> 运算符
>
> 操作符
>
> 异常处理
>
> OOP 对象与类
>
> 函数
>
> 类
>
> 数据结构与算法

Notes

> 由于目前互联网上有更好的文章来记录代码规范和语法，目前代码不作记录，主要还是依靠要孰能生巧和灵活运用。”不重复造轮子“，只要文章和目的能够保持一致即可。

## 2. 应用

面向应用，实现该程序的价值或者创造价值。

### 2.1 基础

基础环境；Python+Windows（or Linux）+Idea

制作思路：目的，文档，构建，测试，投入使用

技术支持：流畅的Python、每周实例、数据结构与算法

### 2.2 需求

检查主机是否开机？检查 Web 访问是否正常？检查 STMP 服务是否运行？

- 主机提供的调试 API：ping return API
- python 现有的“模块”，比如：requests、ping3
- 可复用代码的前提：loging、io、datetime、面向对象、数据结构等等
- 合适的编码工具：pycharm
- 代码到达标准，开始投入使用

根据以上，具体化：

- 根据需求分析现有的API、资源
- 寻找现有的 “模块”（即前人所造的“轮子”）
- 配合系统的模块：可复用、可维护 
- 合适的 GUI 开发工具 Pycharm 社区版
- 开发、测试
- 投入使用
- 补充：维护手册



### 2.3 必备工具箱 「Docs」

合适的文档和社区可以让事情事半功倍。

1. [Python Docs](https://docs.python.org/zh-cn/3.8/)

> 官方文档，稳的一批

2. [Python 3 标准库实例教程](https://learnku.com/docs/pymotw)

> Python 3 库的示例教程，供学习和参考

3. [Python Cookbook 3rd Edition Documentation](https://python3-cookbook.readthedocs.io/zh_CN/latest/preface.html)

> Python 食谱，优秀的应用的示例

4. [stackoverflow](https://stackoverflow.com/)

> stackoverflow + google，合理利用可以解决 90% 的问题

5. [Full Stack Python ](http://fullstackpython.atjiang.com/)

> Full Stack Python  是一本开源图书，它用朴实的语言阐释概念并提供相关主题的最有用资源。

### 2.4 方向扩展

1. Spider：数据处理、自动化；
2. Web：Djiango、Fask；
3. DevOps：为其他程序而服务，对于其他知识也要有基础储备；

## 附录

### Reference

1. [Learn Python code](https://learnxinyminutes.com/docs/python/)
2. [Full Stack Python ](http://fullstackpython.atjiang.com/)
3. [stackoverflow](https://stackoverflow.com/)
4. [Python Cookbook 3rd Edition Documentation](https://python3-cookbook.readthedocs.io/zh_CN/latest/preface.html)
5. [Python 3 标准库实例教程](https://learnku.com/docs/pymotw)
6. [Python Docs](https://docs.python.org/zh-cn/3.8/)
7. [编程泛型解析 -- blog](https://www.raychase.net/2265)
8. [讨论”编程泛型“与”高级程序语言的特性“ -- Blog](https://aimingoo.github.io/1-150.html)

### Books

1. 「流畅的 Python」Luciano Ramalho - 人民邮电出版社
2. 「数据结构与算法：Python语言描述」 裘宗燕 - 机械工业出版社


Notes:	Python 的发展和互联网、开源思想很靠近，请合理地利用网络资源。





