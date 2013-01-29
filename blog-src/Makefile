# vim:set noet: 
all:
	mkdwiki . -o ../
	
clean:
	rm .mkdwiki.cache~

dir:
	python dir_htmls.py

push:all
	cd ..;git add .;git commit -m 'st';	git status;git push;
