---
layout: post
title:  "Quick and Easy Mail Setup"
date:   2014-12-28
tags: Tutorials
---
I work a lot with application servers and virtual machines.
While these are not mail servers they do need to be able to send out email for various reasons.

This post demonstrates how to install Postfix and Mailutils on Ubuntu.

Postfix
=======
Installing postfix is quite easy.

{% highlight bash %}
sudo apt-get install postfix
{% endhighlight %}

Following along with the install wizard and keeping the defaults is generally fine.

![Postfix Install]({{ site.url }}/assets/postfix/postfix-install-1.jpg "Postfix Install")
![Postfix Install]({{ site.url }}/assets/postfix/postfix-install-2.jpg "Postfix Install")

Mailutils
=========
Following postfix I install mailutils

{% highlight bash %}
sudo apt-get install mailutils
{% endhighlight %}

With mailutils you can send out mail from the commandline with ease:
{% highlight bash %}
mail -s "Hello World" someone@example.com
Cc:
Hi Peter
How are you
I am fine
Good Bye
<Ctrl+D>
{% endhighlight %}
If you have trouble sending mail (perhaps you had another mail agent installed), then doing a reinstall might fix the problem.
{% highlight bash %}
service sendmail stop
sudo apt-get install --reinstall postfix
{% endhighlight %}
