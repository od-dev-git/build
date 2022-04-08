## Build all docker from artifacts directory
```sh
docker build --tag egov-accesscontrol egov-accesscontrol/
docker build --tag egov-filestore egov-filestore/
docker build --tag egov-localization egov-localization/
docker build --tag egov-mdms-service egov-mdms-service/
docker build --tag egov-otp egov-otp/
docker build --tag egov-persister egov-persister/
docker build --tag egov-user egov-user/
docker build --tag egov-workflow-v2 egov-workflow-v2/
docker build --tag user-otp user-otp/
docker build --tag zuul zuul/
docker build --tag egov-idgen egov-idgen/
docker build --tag billing-service billing-service/
docker build --tag egov-enc-service egov-enc-service/
docker build --tag property-services property-services/
docker build --tag ws-services ws-services/
docker build --tag sw-services sw-services/
docker build --tag tl-calculator tl-calculator/
docker build --tag tl-services tl-services/
```
