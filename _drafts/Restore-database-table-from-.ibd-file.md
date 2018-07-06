---
layout: post
title:  "Restore database table form .ibd file"
subtitle: "my subtitle"
date:   2018-06-05
tags: ["How To"]
---

So at work I had an incident where the data in a database table was overwritten. While we do have multiple backups, this particular table's backup was not a typical sql dump file, but various full and incremental backups from xtrabackup.

The issue I faced was that I did not want to do a complete restore of 40 gigs of data for this one small table. So after a good 8 hours or so of trying various techniques and tracking down solutions for a number of different errors, the end solution turns out to not be so difficult.

Hopefully, this post will save you hours of frustration that I went through (and also serve as documentation for myself if/when I need todo this again).

### What are these files ###
When you create an InnoDB table, two files are created:
  * .frm file - This file contains the table definition
  * .ibd file - The data file for the database table

### The issue ###
Database table needs recovered from .ibd file due to data being overwritten. SQL Dump file not available.

### What you will need ###
  * Another server to retore to. I used vagrant to perform this task.
  * A backup .ibd file to restore from
  * Table structor of the database table (SQL Create statement)

### The Process ###
At this point, I'm going to assume that you have access to another server and can connect to the database. Also that you have a copy of your .ibd file on hand and have the create table syntax handy.

* On the new database, create the table.
```
Create table ...
```
* Discard tablespace for the table - this will remove the .ibd file that was just created

   ```
   ALTER TABLE {your table name} DISCARD TABLESPACE;
   ```

* Copy your .ibd file to /var/lib/mysql/{database name}/
* Make sure ownership is correct for your file after moving it
```
sudo chown mysql:mysql /var/lib/mysql/{database name}/{table name}.ibd
```
* Now you have to import the .ibd file you're wanting to restore
```
ALTER TABLE dc_ipod_inventory IMPORT TABLESPACE;
```
    
So, that should be it.

At this point you should be able to perform an export or dump and import back into your original database table.
    



