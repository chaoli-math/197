all : main clean

color : cmain

pic :
	xelatex -synctex=1 main.tex
	zhmakeindex -q -s indexstyle.mst main
	xelatex -synctex=1 main.tex

main : 
	aplatex -synctex=1 main.tex
	zhmakeindex -q -s indexstyle.mst main
	aplatex -synctex=1 main.tex

cmain :
	xelatex cmain.tex
	zhmakeindex -q -s indexstyle.mst cmain
	for i in 1 2 3; do xelatex cmain.tex; done

clean :
	rm *.aux *.ilg *.out *.dvi *.toc
