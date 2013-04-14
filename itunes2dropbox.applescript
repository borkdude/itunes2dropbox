-- DISCLAIMER: use at own risk and responsibility
-- copies the currently playing track, or if no track is playing, the selected track (only 1) from iTunes to the Public Dropbox folder 
-- and copies a link to the clipboard which you can share in Twitter, Facebook, etc
-- The Dropbox link is generated from the name of this script, so save the script as 3914693.scpt from the Applescript editor if your Dropbox-number is 3914693.
-- The script assumes a default location of the Dropbox folder, so change when you do not use Dropbox's default..
-- This script can be used in combination with Alfred, so sharing your track is done with only one keystroke to copy to public folder and generate link.

tell application "Finder"
	set x to path to me
	set y to name of file x as text
	set dropBoxNo to text 1 thru ((offset of "." in y) - 1) of y
end tell

on splitText(delimiter, someText)
	set prevTIDs to AppleScript's text item delimiters
	set AppleScript's text item delimiters to delimiter
	set output to text items of someText
	set AppleScript's text item delimiters to prevTIDs
	return output
end splitText

on copyDropbox(theFile, theArtist, theTrack)
	set myPath to (path to home folder) as string
	set myPath to myPath & "Dropbox:Public:"
	
	do shell script "cp " & (quoted form of POSIX path of (theFile as text)) & " " & (quoted form of POSIX path of (myPath as text))
	
	set fileName to item (count splitText(":", theFile)) of splitText(":", theFile)
	set fileName to do shell script "/usr/bin/python -c 'import sys, urllib; print urllib.quote(sys.argv[1])' " & " " & "'" & fileName & "'"
	set filePath to "https://dl.getdropbox.com/u/" & my dropBoxNo & "/" & fileName
	
	tell application "Finder" to set the clipboard to theArtist & " - " & theTrack & ": " & filePath as text
end copyDropbox

tell application "iTunes"
	--activate
	if player state is playing then
		set mySelection to {current track}
	else
		if kind of container of view of front browser window is not library or selection is {} then
			display dialog "You must select a track first." buttons {"Cancel"} default button 1 with icon 2 with title "Error" giving up after 15
		end if
		set mySelection to selection of front browser window
	end if
	
	if (count of items in mySelection) is not 1 then
		display dialog "Please select exactly one track." buttons {"Cancel"} default button 1 with icon 2 with title "Error" giving up after 15
		return
	end if
	
	repeat with theTrack in mySelection
		set trackLocation to theTrack's location
		set artistName to (get artist of theTrack)
		set trackName to (get name of theTrack)
		my copyDropbox(trackLocation as string, artistName as string, trackName as string)
	end repeat
	
end tell

