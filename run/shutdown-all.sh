#!/bin/bash
input="./projects.csv"
while IFS=',' read -r f1 f2
do 
  echo "$f1 $f2"
  sh ../src/shutdown.sh $f1
done < "$input"
