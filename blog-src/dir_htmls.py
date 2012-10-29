#!/usr/bin/env python
#--coding:utf-8--
import os, re, glob

def tree(d, fi):
	if os.path.basename(d) == '.git':
		return 
	for i in os.listdir(d):
		p = os.path.join(d, i)
		if os.path.isdir(p) :
			tree(p, fi)
		elif re.match('.*\.html$', os.path.basename(p)):
			f = open(p)
			c = f.read()
			t= title_re.search(c)
			title=t.group(1).strip() if t else os.path.basename(p)
			f.close()
			fi.write('1. '+'['+title+']('+os.path.relpath(p, '..')+')\n')
title_re = re.compile(r'<title>(.*)</title>')
fi = open('dir_html.mkd', 'w')
fi.write('%title dir_html\n')
fi.write('###Ctrl+F查找文章\n\n')
tree('..', fi)
fi.close()
print 'dir html list ok.'
