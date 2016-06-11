#!/bin/sh
echo   "are you sure do  Y or N ?"
read go
if [ $go = "Y" ]
then 
  echo "gooooo"
else 
  echo "nooooo"
  exit
  echo "not output"
fi



#echo "----------remote deploy start------------"
#ssh root@120.26.241.215  "sh /root/deploy-zjy.sh"

