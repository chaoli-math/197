all : main clean

color : cmain

xe : 
	xelatex main.tex

ap : 
	aplatex --shell-escape --synctex=1 main.tex
	
# pic :
# 	xelatex main.tex
# 	zhmakeindex -q -s indexstyle.mst main
# 	xelatex main.tex

main : 
	aplatex --shell-escape --synctex=1 main.tex
	zhmakeindex -q -s indexstyle.mst main
	aplatex --shell-escape --synctex=1 main.tex

cmain :
	xelatex cmain.tex
	zhmakeindex -q -s indexstyle.mst cmain
	for i in 1 2 3; do xelatex cmain.tex; done

clean :
	rm *.aux *.ilg *.out *.dvi *.toc

cleanall :
	rm *.aux *.ilg *.out *.dvi *.toc *.synctex.gz* *.ind *.idx *.log
