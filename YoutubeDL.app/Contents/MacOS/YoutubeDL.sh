#!/bin/bash

# save tool paths in variables
CocoaDialog='/Applications/cocoaDialog.app/Contents/MacOS/cocoaDialog'
YoutubeDL='/usr/local/bin/youtube-dl'

# get clipboard content
Clipboard=$(pbpaste)

# run cocoaDialog
# the Return variable contains the selected button string (Cancel,Audio,Video) and the textbox string (URL) in case of Audio and Video
# e.g. "Audio https://vimeo.com/61670313"

Return=`$CocoaDialog inputbox --string-output --no-newline --float --title "YoutubeDL" --informative-text "VideoURL" --text "$Clipboard" --button1 "Video" --button2 "Audio" --button3 "Cancel"`

# check if aborted
if [ ${Return:0:6} == "Cancel" ]; then
   exit 0;
fi

# split Return variable into Audio/Video and URL
Type=${Return:0:5}
URL=${Return:6}

# create audio extraction flag
if [ $Type == "Audio" ]; then
   ExtractAudio="-x";
else
   ExtractAudio="";
fi

# get title, use URL in case of failure
# Title=`$YoutubeDL -e $URL 2> /dev/null || echo $URL`
# getting title can be slow, using URL instead
Title=$URL

# run youtube-dl
$YoutubeDL --newline ${ExtractAudio} -o "/Users/${USER}/Downloads/%(title)s.%(ext)s" $URL | \
   while read line; do echo $line | grep -o -e '\[download\]\s\+[0-9\.]\+' | awk '{print $2 " " $2"% downloaded"}'; done | \
   $CocoaDialog progressbar --float --title "YoutubeDL" --text "downloading $Title"

# create info bubble
if [ ${PIPESTATUS[0]} -eq 0 ]; then
   $CocoaDialog bubble --timeout 3 --icon download --title "YoutubeDL" --text "Download Successful";
else                                                        
   $CocoaDialog bubble --timeout 3 --icon stop --title "YoutubeDL" --text "Download Failed";
fi

exit 0;



