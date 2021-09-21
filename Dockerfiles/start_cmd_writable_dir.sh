#!/bin/bash

helpFunction()
{
   echo "Usage: $0 -d <directory of the image> -hd <host directory (optional)> -cd <container directory (optional)>"
   echo -e "\t-d  Directory where a img_name.txt file is present"
   echo -e "\t-hd Directory on the host where volume contents will be mapped (optional, defaults to <current dir>/volume_data/<img_name>)"
   echo -e "\t-cd Directory on the container where volume contents will be mapped (optional, defaults to /home/ssiuser)"
   echo -e "Example: $0 -d ./ubuntus/ubuntu_base/"
   exit 1 # Exit script after printing help
}

while getopts "d:" opt
do
   case "$opt" in
      d ) img_name=$(cat ./$OPTARG/img_name.txt) ;;
      hd ) host_dir=$OPTARG ;;
      cd ) cont_dir=$OPTARG ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$img_name" ] 
then
   echo "The directory (-d) parameter is empty";
   helpFunction
fi

if [ -z "$host_dir" ] 
then
   host_dir=`pwd`/volume_data/$img_name
fi
if [ -z "$cont_dir" ] 
then
   cont_dir=/shared
fi

echo -e "Running a container from the $img_name image opening a root bash command line and mapping a volume..."
echo -e "Volume host directory: $host_dir"
echo -e "Volume container directory: $cont_dir"

#sudo docker run -v $host_dir:$cont_dir -it $img_name /bin/bash
#sudo docker run -v $host_dir:$cont_dir -it $img_name env TERM=xterm-color script -q -c "/bin/bash" /dev/null
sudo docker run -v $host_dir:$cont_dir -w /root -it $img_name /bin/bash