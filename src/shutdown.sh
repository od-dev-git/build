#!/bin/bash
kill "$(cat ./pids/$1.pid)"
rm "./pids/$1.pid" 
echo "<====Stopping $1====>"