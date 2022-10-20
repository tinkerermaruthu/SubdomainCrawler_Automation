#!/bin/bash

#Declare

hideoutput=/dev/null 2>&1
filename=domains.txt
filename2=results.txt


# if [[ $EUID -ne 0 ]]; then
#    echo "This script must be run as root" 
#    exit 1
# fi


read  -p 'Domain Name :' target

echo "Starting Amss"
amass enum -passive -d $target -o $filename > $hideoutput
echo "Amss Done"

echo "Starting Sublist3r"
sublist3r -d $target -o $filename > $hideoutput
echo "Sublist3r Done"


echo "Starting Findomaian"
findomain -t $target > $hideoutput > $filename
echo "Findomian is Done"


echo "Starting Subfinder"
subfinder -d $target > $hideoutput > $filename
echo "The Subfinder is Done"

sort -u $filename >  $hideoutput 
chmod 777 $filename 

chmod 777 $filename2

echo "All is Done"
