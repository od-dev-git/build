echo "egov-mdms-service core-services"
sh ../src/shutdown.sh egov-mdms-service

# egov-mdms-service
sh ../src/startup.sh ../artifacts/egov-mdms-service/target/egov-mdms-service-test-1.3.0-SNAPSHOT.jar egov-mdms-service 128m
