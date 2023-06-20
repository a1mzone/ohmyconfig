#!/bin/sh

# requires symbolic link to NEW folder in Music
# downloads only the audio container
# ln -s /mnt/c/Users/IZAKCOETZEE/Music ~/music
# using https://github.com/yt-dlp/yt-dlp since youtube_dl pip is stale

cd ~/Music/NEW/
/usr/local/bin/yt-dlp -f 140 'https://www.youtube.com/watch?v='$1
