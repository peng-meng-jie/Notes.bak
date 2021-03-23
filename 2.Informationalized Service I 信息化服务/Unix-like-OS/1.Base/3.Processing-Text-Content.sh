# Process-Text-Content.sh
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

# Base-cli：find、grep、xargs、sort、uniq、tr、cut、paste、wc、sed、awk
# 1.Find Files（cli：man find）

$ find . \( -^Cme "*.bat" -o -name "*.py" \) -print # 搜索指定文件
./Auto-Logoff-PPC.bat
./Check_FAB_Network.py
...
$ find . -regex ".*\(\.py\)" # 搜索文件，正则表达式
./bak.scripts/#close#GetTodayWeather.py
./bak.scripts/AutoCheckComputerService.py
./bak.scripts/save_as_img.py
...
$ find . ! -name "*.LOG" # 排除文件类型
$ find . -maxdepth 2 -type f # 文件深度
<<!
@ find 文件过滤“功能”（过滤文件）
支持文件类型，find <option> -type f-file l-符号 d-folder
扩展，二进制搜索（cli：file | awk）配合使用
支持时间过滤，find <option> -atime -mtime - ctime
支持大小过滤，find <option> -size <tag>
支持权限过滤，find <option> -perm <tag>
支持用户过滤，find <option> -user 
更多“特性”或帮助，cli:$ man find（或者 Web-Online ）
!
<<!
@ find 扩展功能（过滤后执行操作）
执行删除，find <option> -delete
执行删除 2，find <cli> | xargs rm
附加命令，find <cli> -exec 
> find . -type f -user root -exec chown weber {} \; # 变更权限
> find . -type f -mtime +10 -name "*.txt" -exec cp {} OLD \; # 复制权限
> -exec ./commands.sh {} \; # 附加命令
!

# 2.Context-Search（cli：man grep）
<<!
@ useful-parameter
grep --help (node)
    -o, --only-matching       show only nonempty parts of lines that match # 匹配行
    -c, --count               print only a count of selected lines per FILE # 统计
    -n, --line-number         print line number with output lines # 显示行
        --line-buffered       flush output on every line 
    -I                        equivalent to --binary-files=without-match # 大小写
    -L, --files-without-match  print only names of FILEs with no selected lines # 输出文件名
!
$ grep -e "import" . -R -n
<<!
@ Use
grep -e "class" -e "vitural" <file> # 附加条件（过滤）
cat LOG.* | tr a-z A-Z | grep "FROM " | grep "WHERE" > b # 过滤文本内容（查找SQL代码）
!

# 3.Exchange-parameter（cli：man xargs）
<<! 
$ xargs --help
    Usage: xargs [OPTION]... COMMAND [INITIAL-ARGS]...
    Run COMMAND with arguments INITIAL-ARGS and more arguments read from input.
@ copy
# 统计程序行数
$ find source_dir/ -type f -name "*.cpp" -print0 |xargs -0 wc -l
# redis通过string存储数据，通过set存储索引，需要通过索引来查询出所有的值：
./redis-cli smembers $1  | awk '{print $1}'|xargs -I {} ./redis-cli get {}
$ find /tmp -name core -type f -print | xargs /bin/rm -f
Find files named core in or below the directory /tmp and delete them.  Note that this will work incorrectly if
there are any filenames containing newlines or spaces.
$ find /tmp -name core -type f -print0 | xargs -0 /bin/rm -f
Find files named core in or below the directory /tmp and delete them, processing filenames in such a way  that
file or directory names containing spaces or newlines are correctly handled.
Note:cli man xargs
!

# 4.More-Text-Tools
# includ cli：sort uniq tr cut paste wc sed
# 依据功能的面向方面进行分类（针对于文本的“功能操作”）
# cli-shell-system（api-io[drive-cpu-disk]），从表面的界面对文本进行操作（背后有计算机的底层暗箱操作）
<<!
@ sort # 内容排序
$ sort --help
  Usage: sort [OPTION]... [FILE]...
     or:  sort [OPTION]... --files0-from=F
  Write sorted concatenation of all FILE(s) to standard output.
  With no FILE, or when FILE is -, read standard input.
  -k, --key=KEYDEF          sort via a key; KEYDEF gives location and type
  -n, --numeric-sort          compare according to string numerical value
  ...
Example
ort -nrk 1 data.txt
sort -bd data // 忽略像空格之类的前导空白字符
!
<<!
@ uniq # 消除（或统计）重复内容
$ uniq --help
    Usage: uniq [OPTION]... [INPUT [OUTPUT]]
    Filter adjacent matching lines from INPUT (or standard input),
    writing to OUTPUT (or standard output).
    With no options, matching lines are merged to the first occurrence.
    -c, --count           prefix lines by the number of occurrences
    -d, --repeated        only print duplicate lines, one for each group
$ sort 2021-3-9.LOG | uniq -d
!
<<!
@ tr # 内容转换
$ tr --help
    Usage: tr [OPTION]... SET1 [SET2]
    Translate, squeeze, and/or delete characters from standard input,
    writing to standard output.
Example，Node
@ 通用用法
echo 12345 | tr '0-9' '9876543210' //加解密转换，替换对应字符
cat text| tr '\t' ' '  //制表符转空格
@ 删除字符
cat file | tr -d '0-9' // 删除所有数字
...
!
<<!
@ cut # 切割”文体“
$ cut --help
    Usage: cut OPTION... [FILE]...
    Print selected parts of lines from each FILE to standard output.
    With no FILE, or when FILE is -, read standard input.
    -f, --fields=LIST       select only these fields;  also print any line
$ cut -f2,4 filename # 提取一部分
$ cut -f3 --complement filename # 去除一部分
$ cut -c1-5 file //打印第一到5个字符
$ cut -c-2 file  //打印前2个字符
$ echo string | cut -c5-7 # 截取文本的第5到第7列
!
<<!
@ paste # “移花接木”
$ paste --help
    Usage: paste [OPTION]... [FILE]...
    Write lines consisting of the sequentially corresponding lines from
    each FILE, separated by TABs, to standard output.
    With no FILE, or when FILE is -, read standard input.
    Mandatory arguments to long options are mandatory for short options too.
    -d, --delimiters=LIST   reuse characters from LIST instead of TABs
Example，Test-1
$ cat file1
1
2
$ cat file2
colin
book
$ paste file1 file2 # 拼接
1 colin
2 book
!
<<!
@ wc 统计
$ wc --help
    Usage: wc [OPTION]... [FILE]...
       or:  wc [OPTION]... --files0-from=F
    Print newline, word, and byte counts for each FILE, and a total line if
    more than one FILE is specified.  A word is a non-zero-length sequence of
    characters delimited by white space.
$ wc -l file // 统计行数
$ wc -w file // 统计单词数
$ wc -c file // 统计字符数
!
<<!
@ sed 替换
$ sed --help
  Usage: sed [OPTION]... {script-only-if-no-other-script} [input-file]...
$ cat mk.mk
    # mk
    123
    ## mk 2
    456
$ sed 's/#/E/' mk.mk # 首行替换
    E mk
    123
    E# mk 2
    456
Example
$ sed '/^$/d' file # 去除空白
$ sed -i 's/text/repalce_text/g' file # 另存一份被替换的副本
$ sed 's/text/replace_text/g' file #全局替换
!
# 5. Awk
<<! # 基础
AWK是一种优良的文本处理工具，Linux及Unix环境中现有的功能最强大的数据处理引擎之一。

AWK是一种处理文本文件的语言。它将文件作为记录序列处理。
在一般情况下，文件内容的每行都是一个记录。
每行内容都会被分割成一系列的域，因此，我们可以认为一行的第一个词为第一个域，第二个词为第二个，以此类推。
AWK程序是由一些处理特定模式的语句块构成的。AWK一次可以读取一个输入行。
对每个输入行，AWK解释器会判断它是否符合程序中出现的各个模式，并执行符合的模式所对应的动作。
    ——阿尔佛雷德·艾侯，The A-Z of Programming Languages: AWK!

awk ' BEGIN{ statements } statements2 END{ statements } ' # 基本结构
工作方式，
1.执行begin中语句块；
2.从文件或stdin中读入一行，然后执行statements2，重复这个过程，直到文件全部被读取完毕；
3.执行end语句块；
!
$ echo -e "line1\nline2" | awk 'BEGIN{print "start"} {print } END{ print "End" }'
    start # 开始时执行 begin 代码块
    line1 # 继承管道前面的内容 （ \n 被隐藏）
    line2 # 同上（无 \n）
    End   # 结束时执行 end 代码块
$ echo | awk ' {var1 = "v1" ; var2 = "V2"; var3="v3"; print var1, var1,var2 , var3; }'
v1 v1 V2 v3
$ echo | awk ' {var1 = "v1" ; var2 = "V2"; var3="v3"; print var1, var1","var2 "," var3; }'
v1 v1,V2,v3
# Link：https://www.tutorialspoint.com/awk/awk_basic_examples.htm

# Note 
<<!
## Index
## 文件名处理
文件夹和文件名处理 find 
> 类型 时间 大小 附加操作... + sh 批处理不在话下 ！

## 内容处理
内容搜索 grep
内容转化 xargs
内容排序 sort
重复内容处理 uniq
内容转换 tr
内容拼接 paste
内容统计 wc
内容替换 sed

## 程序化处理文本内容 
@AWK 优秀处理文本文件工具（在众多工具中脱颖而出）
基于文本行进行处理，“批处理”，如下：
行列匹配、shell、正则表达式、循环、变量 ...
$ awk
    Usage: awk [POSIX or GNU style options] -f progfile [--] file ...
    Usage: awk [POSIX or GNU style options] [--] 'program' file ...
    ...
    Examples:
     gawk '{ sum += $1 }; END { print sum }' file
     gawk -F: '{ print $1 }' /etc/passwd
Extend
https://www.tutorialspoint.com/awk/awk_basic_examples.htm
https://www.runoob.com/linux/linux-comm-awk.html
!

