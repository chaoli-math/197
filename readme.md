Nothing here.

----

main是一个普通书本样式，实现由`header.sty`负责，默认A4. 

cmain是一个每章开头带图的样式，实现由`structure.tex`负责，默认B5。由于一些未知的问题，得到最终版需要编译多次，直到得到的pdf文件不变为止。

这里暂时不提供图片，所以建议将源文件中所有的`\pic`命令注释掉（这也是默认情况）。

其他还没想好。

----

编译指南：

直接运行`xelatex main.tex`或者`xelatex cmain.tex`即可得到相关的pdf，为了索引或者引用等，所以建议进行多次编译。

索引的生成文件`.ind`文件已经提供，它给出了`mastar`分支下最新的索引，如果对`.tex`文件进行了修改，则需要进行重新生成。生成索引的工具是[zhmakeindex](https://www.ctan.org/pkg/zhmakeindex?lang=en)，而格式文件`.mst`已经提供。

总之，一次完整的编译流程如下：先运行一次`xelatex main.tex`得到`.idx`文件，然后运行zhmakeindex来得到`.ind`文件，最后再运行一次`xelatex main.tex`。

p.s. 个人推荐的编译环境为Linux下的TeXLive，之所以选用Linux，是因为编译比win下的快不少。