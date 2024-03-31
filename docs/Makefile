all: bundle-install site-build

# build the blog in directory _site
site-build:
	bundle exec jekyll build

# clean all build files of the blog, and remove directory _site
site-clean:
	bundle exec jekyll clean

# start a local web server listening at localhost:4000 for pre-viewing the site
site-serve:
	bundle exec jekyll serve

# install / update the Ruby Gem distribution
bundle-install:
	@echo "#### NOTE: You can safely ignore the error on \`github-pages\` not being specified in Gemfile, if reported."
	@echo "#### NOTE: You can safely ignore the error on \`webrick\` not being specified in Gemfile, if reported."
	echo "source 'https://rubygems.org'" > Gemfile
	-bundle remove github-pages
	bundle add github-pages --group jekyll_plugins
	-bundle remove webrick # Workaround, see: https://github.com/jekyll/jekyll/issues/8523
	bundle add webrick # Workaround, see: https://github.com/jekyll/jekyll/issues/8523
	bundle install
	bundle update

# clean all install files of the Ruby Gem distribution
bundle-clean:
	rm -rf ~/.bundle
	rm -rf vendor
	rm -f Gemfile.lock
	rm -f Gemfile
