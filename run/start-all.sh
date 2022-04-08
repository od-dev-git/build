#!/bin/bash

# zuul
# sh ../src/startup.sh ../artifacts/zuul/target/*.jar zuul

# egov-filestore
# sh ../src/startup.sh ../artifacts/egov-filestore/target/egov-filestore-0.0.1-SNAPSHOT.jar egov-filestore

# egov-mdms-service
# sh ../src/startup.sh ../artifacts/egov-mdms-service/target/egov-mdms-service-test-0.0.1-SNAPSHOT.jar egov-mdms-service

# egov-accesscontrol
# sh ../src/startup.sh ../artifacts/egov-accesscontrol/target/egov-accesscontrol-0.0.1-SNAPSHOT.jar egov-accesscontrol

# egov-idgen
# sh ../src/startup.sh ../artifacts/egov-idgen/target/egov-idgen-0.0.1-SNAPSHOT.jar egov-idgen

# egov-localization
# sh ../src/startup.sh ../artifacts/egov-localization/target/egov-localization-0.0.1.SNAPSHOT.jar egov-localization

# egov-location
# sh ../src/startup.sh ../artifacts/egov-location/target/egov-location-0.0.1-SNAPSHOT.jar egov-location

# egov-otp
# sh ../src/startup.sh ../artifacts/egov-location/target/egov-location-0.0.1-SNAPSHOT.jar egov-location

input="./projects.csv"
while IFS=',' read -r f1 f2 f3
do 
  echo "$f1 $f2"
  sh ../src/startup.sh "../artifacts/$f1/target/*.jar" $f1 $f3
done < "$input"
