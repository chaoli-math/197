Nothing here.

----

main 是一个普通书本样式，实现由 `header.sty` 负责，默认 A4. 

cmain 是一个每章开头带图的样式，实现由 `structure.tex` 负责，默认 A4. 由于一些技术原因，得到最终版需要编译多次，直到得到的pdf文件不变为止。

所有的图片，包括 cmain 中每章开始的题图（出于某些原因全都选了 im@s cgss 中的图），都在 `197.zip` 文件夹中，解压到相应文件夹即可。

其他还没想好。

----

编译指南：

直接运行 `xelatex main.tex` 或者 `xelatex cmain.tex` 即可得到相关的 pdf，为了索引或者引用等，所以建议进行多次编译。索引格式文件 `indexstyle.mst` 已经提供，生成中文索引的工具请使用 [zhmakeindex](https://www.ctan.org/pkg/zhmakeindex?lang=en).

总之，一次完整的编译流程如下：先在根目录运行一次 `xelatex cmain` 得到 `idx` 文件，然后运行 `zhmakeindex cmain` 来得到 `ind` 文件，最后再运行一次 `xelatex cmain`.

p.s 1. 推荐的编译环境为 Linux 下的 TeXLive，之所以选用 Linux，是因为编译比 Windows 下的快不少。同时，本文档默认的字体是开源字体 Fandol，至少 TeXLive 2016 之后，这是包含在整个 TeXLive 中的。

p.s 2. 由于 zhmakeindex 已知的问题，无法很好地处理多音字，所以最终版的编译在使用 zhmakeindex 生成了 `ind` 文件后应该手动进行修改。

-----

如何食用：

主目录下，`Pictures/` 文件夹存放题图，而 `main.tex` 或者 `cmain.tex` 是主文件。其他诸如 `defs.tex` 来存一些定义，`intro.tex` 是前言的翻译，`references.tex` 是引用，`header.sty`与 `structure.tex` 分别实现 `main.tex` 是 `cmain.tex` 的版式。索引相关在编译那里提过了。

每一章在主目录下都有一个文件夹，以 `chap_1/` 为例。文件夹中有一个 `pics/` 文件夹负责插图，一个与文件夹的同名 `chap_1.tex` 文件负责一些整体操作，比如定义一些该章节中需要用到的命令，其余的 `tex` 文件即是每节的翻译。

综上，翻译的最小单位是节，编译时它被插入到各个 `chap_*.tex` 中，而各个 `chap_*.tex` 被插入到主文件中。参与翻译直接修改对应节的 `tex` 文件即可。

----

插图相关：

正文插图只要无脑用 `\inclugra{*.png}` 即可，其中 `*.png` 是在对应章节 `pics` 文件夹中的插图的文件名。

插图一度采用硬编码 bb 的方法（为兼容一些引擎），后来还是放弃了这点，转而用 extractbb 先生成一次 Bounding Box（且以后不用再生成）再编译，这使得我们可以引入上面的 `\inclugra` 而编译速度变慢不多。

----

字体相关：

虽然 Windows 自带字体是可以免费使用（部分字体乃至商用），但是，使用开源字体可以保证足够的跨平台性，在不同的平台上可以自由传播、安装、使用。本文默认使用开源字体 [Fandol](https://www.ctan.org/tex-archive/fonts/fandol?lang=en)，如果使用 TeXLive 2016 以及更新的版本，这个字体是包含其中的。

同时，在 `main.tex` 与 `cmain.tex` 中，我们给出了如何替换字体的一个范例（默认注释）如下：

```latex
\setCJKmainfont[
 	ItalicFont = AdobeKaitiStd-Regular ,
 	BoldFont = SourceHanSerifCN-Bold ,
]{SourceHanSerifCN-Regular}
\setCJKsansfont{Source Han Sans CN}
```

默认替换的宋体是 Adobe 于2017年4月正式推出的 [Source Han Serif](https://source.typekit.com/source-han-serif/cn/)，即中文名为思源宋体的多字重宋体。这里用到 Regular 和 Bold 两个字重。而替换的楷体是 [Adobe 楷体](https://typekit.com/fonts/adobe-kaiti)，比起 Fandol 的楷体，他更加适配思源宋体。这里默认使用或替换的字体都是开源字体。

使用字体需要先安装字体。安装字体，一是可以直接将字体文件放到项目的主目录，然后使用 `xelatex` 编译。同时也可以将其安装到系统，在使用 `fc-cache -fv` 刷新字体缓存后，使用 `xelatex` 编译。

p.s. 增加了 moha 的字体，见[这里](https://github.com/chaoxu/naivemoha). 代码有所魔改。
