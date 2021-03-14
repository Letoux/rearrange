#!/bin/bash

music_folder=$1

if [ $# -ne 0 ]
then
    if [ -d $music_folder ]
    then
	gcc epur_title.c
	cd $music_folder
	for folder in */ ; do
	    cd $folder
	    for music in * ; do
		mv $music "$(../../a.out "$(mp3info $music | grep Title)")"
		if echo $? == 0; then printf "\e[92m$music title was sucessfully changed\n"; else printf "\e[31mA problem occured, please see error\n"; fi;
	    done
	    cd ..
	done
	cd ..
	rm a.out
    else
	echo "Error: this directory does not exist."
	echo "Press M to print the manual"
	read -n1 key
	echo
	if [ $key == "m" ] || [ $key == "M" ]; then echo && cat how_to.txt; fi;
    fi
else
    echo "RTFM"
fi
