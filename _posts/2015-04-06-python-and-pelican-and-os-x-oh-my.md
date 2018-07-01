---
layout: post
title:  "Python and Pelican and OS X Oh My"
date:   2015-04-06
tags: ["Tips & Tricks"]
---
Installing Pelican on OS X is not quite as simple as most things.

I work in linux daily and am a custom to installing and configuring software for various things.
apt-install this, yum install that. OS X is a bit different.

Pelican requires python - OS X has python (kind of). It's really stripped down.
I installed pip and pelican and ran quickstart and quickly hit a roadblock of errors.

With a bit of googling, many people suggest using homebrew - I prefer to keep my installs as native as possible but I gave in on this - after all I'm wanting a quick and simple setup to testing things out.

Notes
=====
* I have XCode installed already - if you do not have this installed already doing so would be the 1st step.
* I previously installed pelican and the following did not work until I uninstalled it (pip uninstall pelican) and reinstalled after having homebrew installed.

The Install
===========

* Install pip if you do not already have it installed
{% highlight bash %}
sudo easy_install pip
{% endhighlight %}

* Install Homebrew:
{% highlight bash %}
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
{% endhighlight %}

* Adjust your ~/.profile
{% highlight bash %}
vi ~/.profile
{% endhighlight %}
and add
{% highlight bash %}
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
{% endhighlight %}

* Now install Python
{% highlight bash %}
brew install python
{% endhighlight %}

* Install virtualenv
{% highlight bash %}
pip install virtualenv
{% endhighlight %}

* Finally
{% highlight bash %}
virtualenv pelicanvenv
{% endhighlight %}

OK that's everything for the prep work.
Now we can actually install Pelican (and markdown)!!
{% highlight bash %}
pip install pelican markdown
{% endhighlight %}

Now you can create your pelican project and initialize it with:
{% highlight bash %}
mkdir my-project
cd my-project
pelican-quickstart
{% endhighlight %}

For working with pelican you can read the documentation at [http://docs.getpelican.com/en/3.5.0/quickstart.html](http://docs.getpelican.com/en/3.5.0/quickstart.html)
