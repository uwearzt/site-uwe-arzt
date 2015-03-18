+++
title = "Changed to static Website with hugo"
date  = "2015-01-04"
type = "blog"
categories = [ "Other" ]
project_url = "https://github.com/uwearzt/website-uwe-arzt.git"
+++

I had a Wordpress installation till now. But Wordpress has some disadvantages:

* you need a Database instance, it is not easy to have a failover if you have two servers a t different hosting providers
* there are a lot of security upgrades
* It uses a lot of CPU power (compared with static pages)
* No chance to track changes in git

So i decided to change it to a static generated Page back again. I tested a bunch of Website generators, and
that is what i am using now:

<!--more-->

## Used Software

* [Hugo - a really fast stic website generator](https://gohugo.io)
* [highlight.js - Syntax highlighting for the Web](https://highlightjs.org)
* [Node.js - Javascript Platform](http://nodejs.org/)
* [Bootstrap - HTML and CSS responsive framework](http://getbootstrap.com/)

Comments get via EMail to me, and are integrated into the pagesource (instead of simply approving like in
Wordpress).

If you would like to look, how i have set up my webpage, you can clone the complete source from
[github](https://github.com/uwearzt/site-uwe-arzt.git).
