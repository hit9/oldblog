# vim:set noet: 
all:
	mkdwiki . -o ../
	
clean:
	rm .mkdwiki.cache~

dir:
	python dir_htmls.py

push:all
	cd ..;git add .;git commit -m 'Just no commit message';	git status;git push;
