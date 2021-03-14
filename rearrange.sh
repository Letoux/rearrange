#!/bin/bash

music_folder=$1

if [ -d $music_folder ]
then
    cd $music_folder
    for folder in */ ; do
	cd $folder
	for music in * ; do
	    mp3info $music
	done
	cd ..
    done
else
    echo "Error: this directory does not exist."
    echo "Press M to print the manual"
    read -n1 key
    echo
    if [ $key == "m" ] || [ $key == "M" ]; then echo && cat how_to.txt; fi;
fi
