#!/bin/bash

helpFunction()
{
   echo "Usage: $0 -d <directory of the image>"
   echo -e "\t-d Directory where the image Dockerfile is present"
   echo -e "Example: ./build.sh -d ./ubuntus/ubuntu_base/"
   exit 1 # Exit script after printing help
}

while getopts "d:" opt
do
   case "$opt" in
      d ) dir_name=$OPTARG ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$dir_name" ] 
then
   echo "The directory (-d) parameter is empty";
   helpFunction
fi

img_name=$(cat ./$dir_name/img_name.txt)

echo -e "Building the $img_name image..."
old_dir=$(pwd)

cd $dir_name
sudo docker build --compress --force-rm -t="$img_name" .
cd $old_dir

# Perform post-build dangling image cleanup
sudo docker rmi $(sudo docker images -f "dangling=true" -q) 2>/dev/null