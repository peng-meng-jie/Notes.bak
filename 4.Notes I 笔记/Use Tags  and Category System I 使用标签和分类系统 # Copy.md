##### Use Tags  and Category System

使用标签和分类系统



知识是一个系统，我目前借助了一个数字信息化的平台

首先，大文章使用 Markdown、小文章或收集信息采用云笔记（OneNote、Evernote）

所以呢，这是我的一个辅助系统，它的意义在与帮助我去给相关的文字打标签或分类。并以最总的目标为主，学习肯定为了使用知识，然后继续学习继续继续使用。知一寸知识多一份乐趣，探索这个神奇的世界。

**主题：使用标签和分类进行辅助笔记**



##### 1. Tags

> [标签 (元数据)](https://zh.wikipedia.org/wiki/標籤_(元數據))，关键字或分配某项物品的信息资料，包含叙述子与物件关连性的一种元数据。应用于档案管理、文章、网站的分类等。

##### A、针对 Windows 的环境

不同的文件有不同的标签和结果，比如视频、音乐、Office 都有不同的文件格式，它们均支持嵌套“标签”信息在文件中。但是 Markdown 却不行。参看方法

> File > Property > Detail，就能够看到各种各类的标签和其他信息

Office 的支持内容最多，但是对于个人的方法不是很适合于日常使用

但针对于 Markdown 该如何应用呢 ？借用 CI 的“思维”的操作和编辑，例如

> FullName：tests-title -tag test -other test
>
> name：tests-title
>
> tag：test
>
> other：test

再不嵌套任何的程序上，这应该时期目前的”最优解“既符合 Windows 的文件系统，又能够符合我的标签系统。

反正我也不想其他的事情就这样拿来当辅助用着吧。

> 主力：Folder Name And Knowledge

##### B、针对 Markdown 中 tag 应用

在 Markdown 中使用标签是为了方便于统计数据，直接引用之前的内容

Markdown format-exchange to Excel	-tag format-exchange	-static c

- Requirement

  记录文本的本身并不是很符合统计文本的特性 ！那又该如何兼容记录、又能够方便统计呢 ？

- Analysis

  在 Markdown 中记录表格，方能统计但内容编辑限制，pass

  在 Excel 中记录，方便统计内容依旧收到限制，pass

  标志格式化，Markdown 中使用标记格式，succeed

- Result

  model：####（title tag）	（space * 4）-tag [tag-name]	（space * 4）static [tag-name]

  > examples：##### examples title	-tag examples-tag-name	-static examples-tag-name

- Note



##### C、针对 OneNote 内

微软已经帮我想好了，不去折腾，想用就用。

>  [OneNote Use Tag](https://docs.microsoft.com/zh-cn/graph/onenote-note-tags) 
>
> [搜索带标记的笔记，在 OneNote 中](https://support.microsoft.com/zh-cn/office/%E6%90%9C%E7%B4%A2%E5%B8%A6%E6%A0%87%E8%AE%B0%E7%9A%84%E7%AC%94%E8%AE%B0%EF%BC%8C%E5%9C%A8-onenote-%E4%B8%AD-7077a645-65ed-498f-ad94-61d6274efe79) 

##### D、其他

对于未知或者有更好的迭代产品时该如何呢 ？

基于软件就会受限制于软件，不太希望这样自己，我喜欢于可迁移的方式比如单纯的记事本，但又需要轻度的富文本。权衡利弊之时，我发现了 Markdown ，即是纯文本也是”富文本“（没有图片），一举两得。

所以目前的核心结构就是简单就好：Folder + Markdown

当然我已经有扩展的方向了就是 Office + OneDrive，日后慢慢的挖掘它。



##### 2. Category

> **分类学**（英语：Taxonomy）是一门进行分类的[方法](https://zh.wikipedia.org/wiki/方法)与[科学](https://zh.wikipedia.org/wiki/科學)，源于希腊文的*τάξις*（*taxis*，意指类别），以及*νόμος*（*nomos*，意指方法、法则、科学）。不同层级的分类单位之间，有子分类与母分类的关系。举例而言，车子是一种交通工具，因而车子是交通工具的子分类。

##### A、笔记分类系统

简单就好，我是用文件夹来分来的。

以我目前的笔记结构上看（参考网络的信息）

```powershell
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
l----          12/21/2020  9:19 PM                Archer
l-r--            1/4/2021  8:54 PM                Inbox
l----          12/25/2020  9:05 PM                Knowledge
l----          12/21/2020  9:19 PM                Notes
l----          12/30/2020  7:40 PM                Todo
```

Archer，归档的文件，不一定会拿出来，按年份划分

Inbox，收集各种各样的信息，以方便于我的分析、编辑、以及实践

Knowledge，把各种相互相关的知识集合在一起（非科学分类，类似于个人的”超级标签“）

Note，对于展示无法划分的内容，但已经完成的知识内容，就会放在这里。

Todo，个人的计划中心，各种变更、大型计划和实施。

##### B、None

本来还想创建一个分类和改进，先这样吧，其他的事情也不少

> 先用着，有空回来改进



##### X. Appendix

**Reference**

1. [标签和分类 - bhu](https://www.zhihu.com/question/19566478) 
2. [标签和分类 - blog](http://vonng.com/blog/taxonomy/) 
3. [活用标签，提高笔记搜索效率 - sspai](https://sspai.com/post/57467)
4. [Tag - Wikipedia](https://zh.wikipedia.org/wiki/%E6%A8%99%E7%B1%A4)
5. [分类学 - Wikipedia](https://zh.wikipedia.org/wiki/%E5%88%86%E7%B1%BB%E5%AD%A6)



**Inbox**

> 分类可以既是个人的，又是协作的过程。标签的开放性本质，以社会化参与这种低门槛的形式，可以做到**“追踪所有的链接”。**

> 分类由于只能隶属于一个，所以往往带有武断和不恰当的色彩，它是一个“is a”的问题，属于本质论的范畴，而对事物的“本质”的认定，严格来说，这事只有上帝才能做，换句话说，谁做都不合适。
> 标签则不同，它是一个"has a“的问题，说某个东西有某种属性，要求就没那么严格了。

> **分类**
>
> 分类是一个将思想或事物进行识别、差异化和理性化的过程。也通常是出于某一目的，进行分门别类（分组）。
>
> 最初的博客页面自带了分类功能；文章和类别是一一对应的。后来对分类进行了延伸，允许子类的存在，允许一篇文章对应多个分类。
> **标签**
>
> 标签是网络体系里，对某块信息（网址、图像、文件等）的一个非体系的关键词或术语。有了这种元数据（描述数据的数据）的辅助描述，有利于再次浏览或搜索原数据（被描述的数据）。标签有利于搜索引擎优化。
>
> 标签诞生起就是一对多的形式。由于它也可以用作“分类”，所以它们之间界限不清，容易造成困惑。

> - 标签的**固有性质**适合作为**标签表**的字段出现
> - 标签的**人为分类**适合使用动态分类体系通过外键引入。