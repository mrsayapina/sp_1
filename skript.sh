#!/bin/bash
echo "*******************************************************"
echo "Programm for working with image"
echo ""
echo "You are able to change the format and size of the image"
echo ""
echo "Developer: Marina Sayapina"
echo "*******************************************************"
echo ""
while true
do
	read -p "Please, enter file's name: " fname
	if test -f "$fname"
	then
		echo "File found: " $fname
		echo ""
	else
		echo "File not found">&2
		echo ""
		read -p "Continue? (y/n): " answer
		if [[ "$answer" == "Y" || "$answer" == "y" ]]
		then
			continue
		else
			exit 1
		fi
	fi
	read -p "Please, enter new file's format: " format
	if [[ "$format" == "bmp" || "$format" == "png" || "$format" == "jpg" || "$format" == "gif" || "$format" == "tiff" ]]
	then 
		read -p "Please, enter new file's size: " size
		mogrify -format $format $fname
		mogrify -resize $size $fname
		echo ""
		read -p "Сonversion completed. Сontinue (y/n): " answer 
		echo ""
		if [[ "$answer" == "Y" || "$answer" == "y" ]]
		then
			continue
		else
			exit 2
		fi
	else 
		echo "Format is not correct!" 
		read -p "Continue? (y/n): " answer
		echo ""
		if [[ "$answer" == "Y" || "$answer" == "y" ]]
		then
			continue
		else
			exit 3
		fi     	
	fi
done