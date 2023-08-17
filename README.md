bangline.co.uk
==============

A super simple jekyll site using tailwindcss.

Development
-----------

Easy

```
bundle exec jekyll serve --livereload
```

Deployment
----------

Deploying using cloudflare pages. The following env variables are required.

```
JEKYLL_ENV=production
NODE_ENV=production
YARN_ENABLE_IMMUTABLE_INSTALLS=false
```
