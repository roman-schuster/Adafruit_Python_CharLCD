#!/bin/bash
# Smart Scale Prototype 1.0

export GOOGLE_APPLICATION_CREDENTIALS='/Users/roman/Desktop/Smart Scale 1-73e4f13b6ab0.json'
export GCLOUD_PROJECT='Smart Scale 1'

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

sox speech.wav speech.flac

CHECK4FLAC=$(find $CURRENTDIR -name speech.flac | wc -l)

if [ $CHECK4FLAC == 1 ]; then
    echo "FLAC successfully created"
fi

export GOOGLE_APPLICATION_CREDENTIALS='/home/pi/Adafruit_Python_CharLCD/Smart Scale 1-9857f1adb443.json'

sudo python googleSpeechApi.py speech.flac


