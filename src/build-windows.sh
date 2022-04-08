#!/bin/bash
path=$1
path=${path//od-config\//}
echo "Repository path $path, Folder path $2"
rm -rf "../../build/artifacts/$2"
## Switch directory
path=$(echo ${path}/${2})
## mvn build skipping tests
eval "cd  $path"
eval "mvn clean package -Dmaven.test.skip=true"

## create destination directory
mkdir -p "../../build/artifacts/$2/target/"

## copy jar, docker file and startup script
cp target/*.jar "../../build/artifacts/$2/target/"
cp Dockerfile start.sh "../../build/artifacts/$2"

