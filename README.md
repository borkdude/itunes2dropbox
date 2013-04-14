ITUNES 2 DROPBOX
================

Share the current playing song or selected songs from iTunes to your Dropbox public folder.
A public link will be copied to the clip board for instant sharing.
Written in applescript, so Mac only. 

**DISCLAIMER: Use at your own risk and responsibility. The author of
  this script does not take any responsibility for its usage by other
  persons than himself.**

Installation
------------
Open `itunes2dropbox.applescript` in the Applescript editor and save
as an `<yourdropboxnumberhere>.scpt` in some directory of your
convenience. Insert your unique Dropbox number. This number can be
found as described below.

Public Dropbox Folder and the unique number
-------------------------------------------
If you don't have a public folder on your Dropbox account, visit
[this link](https://www.dropbox.com/enable_public_folder).
To get your unique Dropbox number, put a file in this directory on
your local Dropbox and right-click this file. Select Dropbox > Copy
Public link. This link will look something like
`https://dl.dropboxusercontent.com/u/3914693/fileyoujustshared.txt`.
The number in my case is `3914693`, your number will be different. 

Usage
----

In case a song is playing in iTunes and the script is executed, the
song will be copied to your public Dropbox folder. If iTunes isn't
playing, a selected song will be copied. Only one song should be
selected. The public link will be copied to the clipboard for
sharing with your friends.

Problems
--------
The script assumes the path to your Dropbox folder is the default that
Dropbox uses during installation. To change it, change the following
lines in the script accordingly: 

    set myPath to (path to home folder) as string
	set myPath to myPath & "Dropbox:Public:"
        
Alfred 
------
I use this script with
[Alfred](http://www.alfredapp.com/)'s HotKey feature and have put it under
Cmd-Option-S.

Thanks 
------ 
Thanks to [@instantypo](http://www.twitter.com/instantypo), a friendly dogmatic
Flemmish Catholic convert on Twitter, who gave me the idea to write
this script. My first Applescript experience on my first Macbook.
