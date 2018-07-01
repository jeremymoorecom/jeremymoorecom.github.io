---
layout: post
title:  "Unable to mount root fs"
date:   2015-01-05
tags: ["Tips & Tricks"]
---
How to fix kernel panic-not syncing: VFS: unable to mount root fs on unknown block(0,0)

Today we had a server get powered down by accident. Normally this is not an issue, until the server didn't come backup. When we sat down in front of the system, we were presented with

{% highlight bash %}
kernel panic-not syncing: VFS: unable to mount root fs on unknown block(0,0)
{% endhighlight %}

This was rather alarming, especially as this server had been running without issue for many years (not to mention we had another server crash in the last month that had to be reinstalled).

After some quick googling we discovered that we could access the system's Grub menu by holding the **shift** key when booting. This provided us a means to select another Kernel to boot into (the top selection was the current Kernel and not working. After trying 2 or 3 different Kernels we had access to the system so we could fix the issue.

The issue
---------

The problem was that our root filesystem (/root) had run out of space.

To view the available disk space run

{% highlight bash %}
df
{% endhighlight %}

The problem was that our root filesystem (/root) had run out of space.

To view the available disk space run

How to fix
----------
To see what Kernels are installed run

{% highlight bash %}
dpkg --get-selections | grep linux-image-
{% endhighlight %}
We had about a dozen Kernels listed. We need to remove some to free up space but before doing so we need to know what Kernel we're currently running.

{% highlight bash %}
uname -a
{% endhighlight %}
Now we can move on to removing some unused Kernels. The recommended solution is to run
{% highlight bash %}
sudo apt-get remove linux-image-
{% endhighlight %}
pressing tab to pick a kernel to remove.

This works fine - **if you have the available disk space**, which we don't. So you have to manually remove some of these.

Step 1.

{% highlight bash %}
sudo rm /boot/*3.2.0-32*
{% endhighlight %}
Replace the version number with the oldest Kernel you have listed.

Step 2.
{% highlight bash %}
sudo apt-get -f install
{% endhighlight %}
If step 2 exits with an error, repeat step 1 and step 2. Once step 2 is able to finish without an error, we can carry on with the recommended way.
{% highlight bash %}
sudo apt-get remove linux-image-
{% endhighlight %}
pressing tab to pick a kernel to remove.

Once you've removed the old kernels, reboot and you should be up and running just fine.

Summary
-------
What I have outlined here are the key points we took to get our server running again. I've skipped over a lot of the trial & error that was taken being "safe & cautious".
