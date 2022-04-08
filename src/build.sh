#!/bin/bash
echo "Repository path $1, Folder path $2"
rm -rf "../../build/artifacts/$2"
## Switch directory
cd "$1/$2"
## mvn build skipping tests
mvn clean package -Dmaven.test.skip=true
## create destination directory
mkdir -p "../../build/artifacts/$2/target/"

## copy jar, docker file and startup script
cp target/*.jar "../../build/artifacts/$2/target/"
cp "../../build/src/Dockerfile" "../../build/src/start.sh" "../../build/artifacts/$2"
cd ../../build/artifacts/
if [ ${SHOULD_BUILD_IMAGE} ]
then
docker build --tag $2 $2/
else
 echo "Skipping Docker image rebuild"
fi
