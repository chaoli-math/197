Nothing here.

----

main是一个普通书本样式，实现由`header.sty`负责，默认A4. 

cmain是一个每章开头带图的样式，实现由`structure.tex`负责，默认B5。由于一些未知的问题，得到最终版需要编译多次，直到得到的pdf文件不变为止。

源文件中所有的包含图片插入的命令默认是注释掉的，需要图片的话要手动取消注释。所有的图片，包括题图（由于翻译者的个人喜好全都选了im@s cgss中的图），都在`197.zip`文件夹中，解压到相应文件夹即可。

其他还没想好。

----

编译指南：

直接运行`xelatex main.tex`或者`xelatex cmain.tex`即可得到相关的pdf，为了索引或者引用等，所以建议进行多次编译。

索引的生成文件`ind`文件已经提供，它给出了`mastar`分支下最新的索引，如果对`tex`文件进行了修改，则需要进行重新生成。生成索引的工具是[zhmakeindex](https://www.ctan.org/pkg/zhmakeindex?lang=en)，而格式文件`mst`已经提供。

总之，一次完整的编译流程如下：先在根目录运行一次`xelatex main`得到`idx`文件，然后运行`zhmakeindex main`来得到`ind`文件，最后再运行一次`xelatex main`。

p.s 1. 个人推荐的编译环境为Linux下的TeXLive，之所以选用Linux，是因为编译比win下的快不少。

p.s 2. 由于zhmakeindex已知的问题，无法很好地处理多音字，所以最终版的编译在使用zhmakeindex生成了`ind`文件后应该手动进行修改。

-----

如何食用：

主目录下，`Pictures/`文件夹存放题图，而`main.tex`或者`cmain.tex`是主文件。其他诸如`defs.tex`来存一些定义，`intro.tex`是前言的翻译，`references.tex`是引用，`header.sty`与`structure.tex`分别实现`main.tex`是`cmain.tex`的版式。索引相关在编译那里提过了。

每一章在主目录下都有一个文件夹，以`chap_1/`为例。文件夹中有一个`pics/`文件夹负责插图，一个与文件夹的同名`chap_1.tex`文件负责一些整体操作，比如定义一些该章节中需要用到的命令，其余的`tex`文件即是每节的翻译。

综上，翻译的最小单位是节，编译时它被插入到各个`chap_*.tex`中，而各个`chap_*.tex`被插入到主文件中。参与翻译直接修改对应节的`tex`文件即可。