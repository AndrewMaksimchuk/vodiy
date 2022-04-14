#!/usr/bin/env bash


# CATEGORY_NAME="Знаки пріоритету"
# CATEGORY_DIRECTORY="Signs_of_superiority"
# URL=https://vodiy.ua/znaky/2


CATEGORY_NAME=$1
CATEGORY_DIRECTORY=$2
URL=$3


URL_LIST_DESCRIPTION=url_descriptions.txt
URL_LIST_IMAGES=url_images.txt
FOLDER_OF_IMAGES=images
FOLDER_OF_DESCRIPTION=descriptions


URL_INDEX=${URL:23}


mkdir $CATEGORY_DIRECTORY
cd $CATEGORY_DIRECTORY


echo "$CATEGORY_NAME" > README.txt


lynx -dump -image-links -nonumbers $URL  | grep "/media/trafficsign_image/" > $URL_LIST_IMAGES
lynx -dump -listonly -nonumbers $URL | grep "/znaky/$URL_INDEX/[123456789]" > $URL_LIST_DESCRIPTION


mkdir $FOLDER_OF_IMAGES
mkdir $FOLDER_OF_DESCRIPTION


file_images=$(cat $URL_LIST_IMAGES)
file_descriptions=$(cat $URL_LIST_DESCRIPTION)


cd $FOLDER_OF_IMAGES
for line in $file_images
do
    wget $line
done


cd ..


cd $FOLDER_OF_DESCRIPTION
for line in $file_descriptions
do
    wget $line
done


exit 0