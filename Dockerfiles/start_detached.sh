#!/bin/bash

helpFunction()
{
   echo "Usage: $0 -d <directory of the image>"
   echo -e "\t-d Directory where a img_name.txt file is present"
   echo -e "Example: $0 -d ./ubuntus/ubuntu_base/"
   exit 1 # Exit script after printing help
}

while getopts "d:" opt
do
   case "$opt" in
      d ) img_name=$(cat ./$OPTARG/img_name.txt) ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$img_name" ] 
then
   echo "The directory (-d) parameter is empty";
   helpFunction
fi

echo -e "Running a container from the $img_name image running services..."
echo -e "(BE CAREFUL: If the image has no foreground services, the container will be terminated)"

sudo docker run -d $img_name