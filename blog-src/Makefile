# vim:set noet: 
all:
	mkdwiki . -o ../
	
clean:
	rm .mkdwiki.cache~

dir:
	python dir_htmls.py

push:all
	cd ..;git add .;git push; git commit -m 'Just no commit message';git push;
