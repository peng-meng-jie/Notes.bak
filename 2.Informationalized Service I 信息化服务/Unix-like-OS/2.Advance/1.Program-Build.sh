# 1.Program-Build.sh
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

<<!
一般源代码提供的程序安装需要通过配置、编译、安装三个步骤；
1. 配置做的工作主要是检查当前环境是否满足要安装软件的依赖关系，以及设置程序安装所需要的初始化信息，比如安装路径，需要安装哪些组件；配置完成，会生成makefile文件供第二步make使用；
2. 编译是对源文件进行编译链接生成可执行程序；
3. 安装做的工作就简单多了，就是将生成的可执行文件拷贝到配置时设置的初始路径下；
!

# 1.config
# 前提是要把东西下载回来，可用 wget 
# 当然还需要其他的依赖项，见：https://www.debian.org/doc/manuals/maint-guide/build.en.html
./configure --help # 获取帮助
./configure --prefix=/usr/local/snmp # 定位问题

# 2.compile
<<!
$ make -h | more
    Usage: make [options] [target] ...
    -f FILE, --file=FILE, --makefile=FILE # Read FILE as a makefile.
!
$make -f myMakefile
<<!
# makefile编写的要点
必须满足第一条规则，满足后停止
除第一条规则，其他无顺序
# makefile中的全局自变量
$@目标文件名
@^所有前提名，除副本
@＋所有前提名，含副本
@＜一个前提名
@？所有新于目标文件的前提名
@*目标文件的基名称
!
$g++ -o unixApp unixApp.o a.o b.o
<<!
选项说明 ：
-o:指明生成的目标文件
-g：添加调试信息
-E: 查看中间文件
应用：查询宏展开的中间文件：
在g++的编译选项中，添加 -E选项，然后去掉-o选项 ，重定向到一个文件中即可:
g++ -g -E unixApp.cpp  -I/opt/app/source > midfile
!
# 3.install
$make install # 进入自动的配置范围以内

# Note
# cli : configure make install g++
<<!
configure ，查看已存在的文件的包中所支持配置项
make ，基于不同的模式对源码进行”个性化“定制，并生成相关的”程序“
g++ ， 扩展程序构建
install ，安装目标的程序
这个教程所提供的知识完全不够用，扩展新的文档才是正确的做法 ！
!


