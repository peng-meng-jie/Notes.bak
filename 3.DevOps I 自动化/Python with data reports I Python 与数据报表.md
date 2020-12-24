#### Python with data reports 

Python 与数据报表

对于复杂的、庞大的数据，让计算机为人服务，IT 管理员作为一个媒介。



#### 1. Requirement

极其难用的 Web 客户端，信息混乱，可阅读性差

需求：获取网页数据，生成 CVS 报表，后期只需复制粘贴同步文件即可



#### 2. Data model

实际人为流程

> 1. 登录
> 2. 访问
> 3. 保存
> 4. 筛选与过滤
> 5. 分类
> 6. 保存

Python Todo

> PIP：请求、HTML 解析、正则、IO、数据格式

Auto Run model

> 1. 基于对象，python oop 设计
> 2. 登录与访问，pip package requests
> 3. 过滤与存储，pip package lxml、bs4、re、io
> 4. 人为同步，cvs to excel and sharepoint

Task Todo

> - [ ] ~~基于对象，可复用设计~~
> - [x] 登录与访问
> - [x] 过滤于存储



#### 3. Building And Tests

##### OOP

基于对象，可复用设计

> 目前内容已经大体完成，但是还有其他的事情，搁浅“耦合性”设计。一个流程下来，发现时间不够用，甚至超支了，所以这个“设定”被斩妖。
>
> 主要是发现内容并不足以进行对象化设计，基于以下代码，对象化设计思路为：
>
> 1. 文本格式化，CURD
> 2. OOP 重新设计
> 3. Requests CSV file



##### 登录与访问

使用 Request 服务建立持久连接

```python
import requests
# Fill in your details here to be posted to the login form.
payload = {
    'inUserName': 'username',
    'inUserPass': 'password'
}
# Use 'with' to ensure the session context is closed after use.
with requests.Session() as s:
    p = s.post('LOGIN_URL', data=payload)
    # print the html returned or something more intelligent to see if it's a successful login page.
    print p.text
    # An authorised request.
    r = s.get('A protected web page url')
    print r.text
        # etc...
```

##### 过滤于存储

正则表达式过滤文本数据，去重和再次排版

```python
import csv
import io
import re
import datetime

# 正则表达式格式化数据
# 
def get_date():
    # 时间名称
    dt = datetime.datetime.now()
    print(dt)
    filename = "{0}-{1}-{2}".format(dt.year, dt.month, dt.day)
    filetime = "{0}-{1}".format(dt.hour, dt.minute)
    file = [filename, filetime]
    file_name = filename + "-" + filetime
    return file_name

# 文件路径
outfilename = r'C:/Users/yihong.liu/Desktop/' + get_date() +'-output.csv'
infilename = r'C:/Users/yihong.liu/Downloads/export.csv'

with open(infilename,'rt',encoding='utf-8') as csvin:
    readfile = csv.reader(csvin, delimiter=',')
    with open(outfilename, 'w',encoding='utf-8') as csvout:
        writefile = csv.writer(csvout, delimiter=',', lineterminator='\n')
        for row in readfile:
            if row == []:
                pass
            else:
                # 格式化数据 1.正常时间、2.关闭时间、3.继续格式化时间
                result = re.findall(r"(\d{1,2}-\d{1,2}-\d{1,2})", row[-1])
                fixdata = re.findall(r"(\d{1,2}-\d{1,2}-\d{1,2}.{1,}[[\u4E00-\u9FA5A-Za-z0-9- -:]{1,}.{1,2}lose)", row[-1])
                int_bool = re.search(r'\d{3,10}', row[0])
                if result == []:
                    pass
                else:
                    if int_bool == None:
                        row.insert(0,'None')
                        row.insert(0,'None')
                        row.insert(0,'None')
                        writefile.writerow(row)
                    else:
                        if fixdata == []:
                            row.insert(0,str("20"+result[0]))
                            row.insert(0,str("20"+result[-1]))
                            m = re.findall(r"\d{1,2}-\d{1,2}",result[-1])
                            row.insert(0,str("20"+m[0]))
                            writefile.writerow(row)
                        else:
                            fixdata_re = re.findall(r"\d{1,2}-\d{1,2}-\d{1,2}", fixdata[0])
                            row.insert(0, str("20" + fixdata_re[-1]))
                            row.insert(0, str("20" + result[-1]))
                            m = re.findall(r"\d{1,2}-\d{1,2}", result[-1])
                            row.insert(0, str("20" + m[0]))
                            print("on: "+result[-1]+", off: "+fixdata_re[-1])
                            writefile.writerow(row)


```

##### Tests

发现过程中的问题，并准确的找出问题所在，Debug 是必须的。

使用的 Debug Tools：

> Fiddle Web Debug
>
> Chrome 87+  F12 Debug
>
> Pycharm 社区版（Command、Debug、Pip）



本次自动化脚本大致流程如下：

> 1. 假设与论证
> 2. 构建代码
> 3. 实现与测试
> 4. 发现问题，Debug
> 5. 统计问题，再次评估
> 6. 更改思路，构建格式化
> 7. 文本格式化测试
> 8. 结果检查
> 9. Dubug 复盘与测试
> 10. 完成
> 11. 补：请合理的官方文档



#### 4. Applying

Windows Terminal Ues

> 直接运行

VS Code  维护

> 1. 更改相关的路径
>
> 2. 优化后期出现的异常问题问题

结

>前期思考充分，后期时间不足，能用质量不高。
>
>四个字：仓促收场



#### Appendix

Reference

1. [how-to-log-in-to-a-website-using-pythons-requests-modul](https://stackoverflow.com/questions/11892729/how-to-log-in-to-a-website-using-pythons-requests-module)
2. Python Docs
3. Python Requests Docs
4. Python 标准库实例

