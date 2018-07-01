---
layout: post
title:  "Total count greater than X"
date:   2015-01-05
tags: ["Tips & Tricks"]
---
At times you need to find out how many values exist in a table with a total count greater than X. Perhaps this is for a report or debugging.

This handy query can provide just that information.

This example is searching a "user_table" and returns all first names were we have more than 1 value for the same first name.

{% highlight sql %}
SELECT DISTINCT(first_name) AS first_name, COUNT(first_name) AS count
FROM user_table GROUP BY first_name HAVING count > 1;
{% endhighlight %}

![more-than-one-query]({{ site.url }}/assets/total-count-greater-than-x/more-than-one-query.jpg "more-than-one-query")
