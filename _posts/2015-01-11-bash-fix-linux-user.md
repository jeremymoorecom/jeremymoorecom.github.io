---
layout: post
title:  "bash fix for linux user"
date:   2015-01-11
tags: ["Tips & Tricks"]
---
Some of the most helpful features in linux terminal is the ability to
1) tab for autocomplete
2) command history using the arrow keys.
However, these are not always enabled for new users.


Enabling this is quick and easy.
{% highlight bash %}
sudo chsh -s /bin/bash <username>
{% endhighlight %}

replace <username> with the user you want to enable.

**chsh** allows editing of the user database information.

**-s** attempts to change the user's shell to newshell
