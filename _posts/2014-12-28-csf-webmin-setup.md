---
layout: post
title:  "CSF and Webmin Setup"
date:   2014-12-28
tags: Tutorials
---
For anything more than a quick test install I almost always install Webmin and CSF (ConfigServer Security & Firewall) to help manage the server.

CSF
===
Installing CSF is very straightforward and provides full instructions [here](http://download.configserver.com/csf/install.txt "CSF Install Instructions").
{% highlight bash %}
wget http://www.configserver.com/free/csf.tgz
tar -xzf csf.tgz
cd csf
sudo sh install.sh
{% endhighlight %}

if csf installed successfully, you can now remove the directory created.
{% highlight bash %}
cd ..
rm -fr csf/ csf.tgz
{% endhighlight %}

Webmin
======
I install webmin with apt-get.

First we have to add the repository. Add the following to /etc/apt/sources.list
{% highlight bash %}
deb http://download.webmin.com/download/repository sarge contrib
deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib
{% endhighlight %}

Install the GPG key
{% highlight bash %}
wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc
rm jcameron-key.asc
{% endhighlight %}

Update & Install webmin
{% highlight bash %}
sudo apt-get update
sudo apt-get install webmin
{% endhighlight %}

Now you can access webmin at https://your-ip-address:10000

StressFree theme
================
The first thing I always do after installing webmin is install the StressFree Theme from https://code.google.com/p/webmin-theme-stressfree/. I wish webmin would adopt this theme for it's default. Feel free to skip installing this theme if you wish.

To install the theme:
* log into webmin.
* Goto Webmin -> Webmin Configuration
* Webmin Themes
* Select the Install theme tab
* Copy the download link from the webmin-theme-stressfree downloads link (https://webmin-theme-stressfree.googlecode.com/files/theme-stressfree-2.10.tar.gz as of this writing)
* Back in webmin, select the 'From ftp or https URL' and paste the link copied.
* Select install theme
* Once installed, select 'Return to themes list'
* StessFree theme should now be an option in the Current theme selection
