#!/bin/bash
if [ -z "$3" ] 
then 
    m="128m"
else 
    m="$3" 
fi
echo "<====Starting $2====>"
echo "jarPath $1"
echo "pidPath $2" 
echo "Using Xmx$m"
nohup java -"Xmx$m" -Xms128m -jar $1 > "./logs/$2.txt" 2>&1 &
echo $! > "./pids/$2.pid"