all:
	mkdwiki . -o ../
	
clean:
	rm .mkdwiki.cache~

push:all
	git add ../* 
	git commit -m 'st' 
	git push
