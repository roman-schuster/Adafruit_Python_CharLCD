#!/bin/bash
# Smart Scale Prototype 1.0

CURRENTDIR=$(pwd)
CHECK4WAV=$(find $CURRENTDIR -name speech.wav | wc -l)
CHECK4FLAC=$(find $CURRENTDIR -name speech.flac | wc -l)


if [ $CHECK4WAV == 1 ]; then
    echo "Removing old WAV file"
    sudo rm -rf speech.wav
fi


if [ $CHECK4FLAC == 1 ]; then
    echo "Removing old FLAC file"
    sudo rm -rf speech.wav
fi
    
echo "Recording"
arecord -t wav -d 5 -r 16000 -D plughw:1,0 speech.wav

CHECK4WAV=$(find $CURRENTDIR -name speech.wav | wc -l)

if [ $CHECK4WAV == 1 ]; then
    echo "Finished Recording"
fi

sox test.wav test.flac

CHECK4FLAC=$(find $CURRENTDIR -name speech.flac | wc -l)

if [ $CHECK4FLAC == 1 }; then
    echo "FLAC successfully created"
fi


