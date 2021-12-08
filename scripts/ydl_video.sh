
#!/bin/sh

# requires symbolic link to NEW folder in Music
# downloads only the audio container
# ln -s /mnt/c/Users/IZAKCOETZEE/Music ~/music

cd ~/videos/
~/.local/bin/youtube-dl -f 137+140 'https://www.youtube.com/watch?v='$1
