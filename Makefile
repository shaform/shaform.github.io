MSG?=update html
BASEDIR=$(CURDIR)
OUTPUTDIR=$(BASEDIR)/output
INCLUDES=css js images favicon.png

GITHUB_PAGES_BRANCH=master

publish: 
	mkdir -p $(OUTPUTDIR)
	node_modules/.bin/jade -o $(OUTPUTDIR) -P index.jade
	cp -r $(INCLUDES) $(OUTPUTDIR)

github: publish
	echo "shaform.com" > $(OUTPUTDIR)/CNAME
	ghp-import -r gh-pages -b $(GITHUB_PAGES_BRANCH) $(OUTPUTDIR) -m "$(MSG)"
	git push origin $(GITHUB_PAGES_BRANCH):master
