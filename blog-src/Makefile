all:
	mkdwiki . -o ../
	
clean:
	rm .mkdwiki.cache~

dir:
	python2 dir_htmls.py

push:all
	git add ../* 
	git commit -m 'st' 
	git status
	git push
