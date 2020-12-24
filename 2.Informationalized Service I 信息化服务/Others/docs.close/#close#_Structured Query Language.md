# Structured Query Language 



意指在于了解数据库和完成应用层的操作，此笔记的目的快速回顾，快速上手，然后根据文档的需求和变化的 API 进行操作。CRUD （增删改查）自然就是该应用领域的优秀代表词。据了解到 SQL 是一个缓慢型的编程语言变动不会太大，高达至 15 年使用周期。一次投入长久利用，必须拥有的储备技能啊。

记录方式：Code、Mind、Application、Note；

> **增删查改**（英语：CRUD ），全称增加（**C**reate，意为“创建”）、删除（**D**elete）、查询（**R**ead，意为“读取”）、改正（**U**pdate，意为“更新”）
>
> **四大部分** ：[数据定义语言](https://zh.wikipedia.org/wiki/資料定義語言)、[数据操纵语言](https://zh.wikipedia.org/wiki/資料操縱語言)、[数据控制语言](https://zh.wikipedia.org/wiki/資料控制語言)、[事务控制语言](https://zh.wikipedia.org/wiki/事务控制语言)

[TOC]

## 1. Basic



## 2. Application

需求：自动信息化数据

来源、原始信息：CVS、Logbook（实体书）、NAS；

自动化流程：采集书籍至 CSV，再从 CSV 至 SQL，中间均要中间件实现；

关键字：python、powershell、sqlite

计划表

```markdown

# 1.数据采集
powershell 、 python 、 nas 、 csv 

# 2.数据转化
python：re、io、sqlite3
sqlite：基础信息、db 设计、关联性、API；
> table#1，id、设备
> table#2，id、仪器、logbook、data、设备、note
> table#3, id、name、logbookID、date

# 3.数据处理
db 存储、加密

# 4.使用和维护
IO、CRUD

```



## Attachment

### 1. Reference

1. Wikipedia

   [SQL 语法](https://zh.wikipedia.org/wiki/SQL语法)

   [SQL](https://zh.wikipedia.org/wiki/SQL)

   [声明式编程](https://zh.wikipedia.org/wiki/宣告式編程)

   [CRUD](https://zh.wikipedia.org/wiki/增刪查改)

2. Github

   [SQL-XMind（from 「Sams Teach Yourself SQL in 10 Minutes (Fourth Edition)」）](https://github.com/cystanford/SQL-XMind)

   [SQL-in-10-minutes-with-notes](https://github.com/alinbxSorcerer/SQL-in-10-minutes-with-notes)

   [NTES_MySQL_notes](https://github.com/yumendy/NTES_MySQL_notes)

3. Blog

   [Notes Share 「Sams Teach Yourself SQL in 10 Minutes (Fourth Edition) 」](https://www.cnblogs.com/anliven/p/6207406.html)
   
4. [Runoob](https://www.runoob.com)

5. [sql - commands](https://www.codecademy.com/articles/sql-commands)

6. [SQLite Docs](https://www.sqlite.org/docs.html)

7. [Command Line Shell For SQLite](https://www.sqlite.org/cli.html)

8. [CS-Notes # SQL -- GitHub ](https://github.com/CyC2018/CS-Notes/blob/master/notes/SQL.md)

### 2. Books

1. [Sams Teach Yourself SQL in 10 Minutes 4th Edition  -- Amazing](https://www.amazon.cn/dp/0672336073)

### 3.  07/10/20 - backup 

四大部分与 CRUD - 07/10/20 - backup 

DDL、DML、DCL、DQL

> - DDL
>   CREATE TABLE
>   DROP TABLE
>   ALTER TABLE
> - DML
>   SELECT FROM TABLE
>   INSERT INTO TABLE
>   UPDATE TABLE SET
>   DELETE FROM TABLE
> - DCL
>   GRANT
>   REVOKE
> - TCL
>   COMMIT
>   ROLLBACK

C R U D

R - Read | 查询

> select · from · where · group by · having · order by

标准：查询、子查询、链接、运算符；

C - Create | 创建，

> pass

创建

U - Update | 修改，

> pass

插入

D - Delete | 删除，

> pass

删除

对对象

数据库、数据表、数据块、特性；



Attachment

Basic

运算符

> [SQL 语法 # 运算符](https://zh.wikipedia.org/wiki/SQL语法#运算符)
>
> |         运算符         |                          描述                          |                   例子                    |
> | :--------------------: | :----------------------------------------------------: | :---------------------------------------: |
> |          `=`           |                          等于                          |            `Author = 'Alcott'`            |
> |          `<>`          | 不等于（许多数据库管理系统除了支持`<>`以外还支持`!=`） |             `Dept <> 'Sales'`             |
> |          `>`           |                          大于                          |        `Hire_Date > '2012-01-31'`         |
> |          `<`           |                          小于                          |            `Bonus < 50000.00`             |
> |          `>=`          |                        大于等于                        |             `Dependents >= 2`             |
> |          `<=`          |                        小于等于                        |              `Rate <= 0.05`               |
> |       `BETWEEN`        |                      在一个范围内                      |     `Cost BETWEEN 100.00 AND 500.00`      |
> |         `LIKE`         |                      字符模式匹配                      |         `First_Name LIKE 'Will%'`         |
> |          `IN`          |                  等于多个可能的值之一                  |       `DeptCode IN (101, 103, 209)`       |
> |   `IS` *或* `IS NOT`   |                 与空值（数据缺失）比较                 |           `Address IS NOT NULL`           |
> | `IS NOT DISTINCT FROM` |              等于值或均为空值（数据缺失）              | `Debt IS NOT DISTINCT FROM - Receivables` |
> |          `AS`          |              用于在查看结果时更改字段名称              |    `SELECT employee AS 'department1'`     |
>
> 有人也提议实现其他运算符，例如[轮廓运算符](https://zh.wikipedia.org/w/index.php?title=轮廓运算子&action=edit&redlink=1)（寻找那些不比任何其他记录“糟糕”的记录）。
>
> 条件（CASE）表达式[[编辑](https://zh.wikipedia.org/w/index.php?title=SQL语法&action=edit&section=3)]
>
> SQL在[SQL-92](https://zh.wikipedia.org/w/index.php?title=SQL-92&action=edit&redlink=1)标准中引入了`CASE/WHEN/THEN/ELSE/END`语句。通常情况下所称的“搜索CASE语句”例子如下：
>
> ```
> CASE WHEN n > 0 
>     THEN '正'
> WHEN n < 0 
>     THEN '负'
> ELSE '零'
> END
> ```
>
> SQL按照`WHEN`条件在源代码中出现的顺序进行判断。如果源代码中没有指定`ELSE`表达式，SQL默认为`ELSE NULL`。SQL标准中还有一种“简单CASE语句”，类似C语言的switch：
>
> ```
> CASE n WHEN 1 
>       THEN 'one' 
>  WHEN 2
>       THEN 'two' 
>  ELSE 'I cannot count that high'
> END
> ```
>
> 该语法是隐式相等条件。通常情况下，遇到[与空值比较](https://zh.wikipedia.org/wiki/空值_(SQL))的情况会发出警告。
>
> 对于[Oracle数据库](https://zh.wikipedia.org/wiki/Oracle数据库)的SQL语法，还可以用`DECODE`函数简化：
>
> ```
> SELECT DECODE(n, 1, 'one', 
>            2, 'two',
>               'i cannot count that high')
> FROM   some_table;
> ```
>
> 最后一个值是可选的，若无指定，默认为`NULL`。另外，与“简单CASE”不同的是，Oracle的`DECODE`会认为两个`NULL`之间相等。[[2\]](https://zh.wikipedia.org/wiki/SQL语法#cite_note-2)

函数

> 引用  [Runoob # SQL 函数](https://www.runoob.com/sql/sql-function.html)

DBMS and NoSQL

> DBMS 即数据库管理系统（DataBase-Manage-System），关系型数据库如 Microsoft SQL、MySQL，应用于数据存储目的上与 NoSQL 存在一定的分歧；NoSQL 即非关系型性数据库，如 Mongodb，应用于”缓存、加速等类似类型“；



