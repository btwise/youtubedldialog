# Youtube-DL Dialog #

## What is *youtubedldialog*? ##
*youtubedldialog* is a little macOS application to download the audio track of a video or the whole video from
[many sites](https://rg3.github.io/youtube-dl/supportedsites.html) by using the [youtube-dl](https://rg3.github.io/youtube-dl/) commandline tool.
*youtubedldialog* is actually just a bash script that uses [cocoaDialog](http://mstratman.github.io/cocoadialog/) for the GUI.

## Why does *youtubedldialog* exist? ##
*youtubedldialog* is just reason to use [cocoaDialog](http://mstratman.github.io/cocoadialog/).
I have 3 bash aliases for some [youtube-dl](https://rg3.github.io/youtube-dl/) calls:

1. alias youtube-audio='youtube-dl —format bestaudio -x'
2. alias youtube-video='youtube-dl —max-quality mp4'
3. alias youtube-wave='youtube-dl —format bestaudio -x —audio-format wav'

And sometimes I am too lazy to fire up a Terminal. I could have written an AppleScript instead, but I wanted to use [cocoaDialog](http://mstratman.github.io/cocoadialog/).
*youtubedldialog* is just another way for the commands #1 and #2 from aboves list.

## How do I install *youtubedldialog*? ##

### The *youtubedldialog* application ###
Download *youtubedldialog* either from [github (git)](https://github.com/marcotrosi/youtubedldialog) or
[bitbucket (mercurial)](https://bitbucket.org/marcotrosi/youtubedldialog) and copy or move the app to your */Applications* directory.

### The dependencies ###
#### youtube-dl ####
If you use the *brew* package manager run ````brew install youtube-dl````

#### cocoaDialog ####
Download the [cocoaDialog](http://mstratman.github.io/cocoadialog/) dmg version 3.0.0-beta7, open the dmg file and put the app in your */Applications* directory.
Maybe the stable version 2.1.1 works too, but then you have to rename *CocoaDialog.app* to *cocoaDialog.app* or
the other way around in the bash script, which is inside the *youtubedldialog* app.

## How do I use *youtubedldialog*? ##
Let's assume you got a video open in your favorite browser from one of the [many supported sites](https://rg3.github.io/youtube-dl/supportedsites.html).
Copy the http address of that video (in Safari that would be CMD+L CMD+C), start *youtubedldialog* (e.g. via Spotlight CMD+Space), *youtubedldialog* will put the copied address in the
VideoURL textbox (feel free to change it), select Audio or Video, wait until the file is downloaded into your Downloads directory. Done.

