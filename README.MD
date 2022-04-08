# Deployment steps

## Setup.

Assuming all your code is checked out into the same repository. This repository should be at the same level as all the other repositories.

`build` <--This repository  
`core-services`  
`municipal-services`  
`business-service`

## Contents

`run` folder contains the scripts that are to be run from the same folder. This folder also contains `projects.csv` which contains the individual spring boot projects to be built. It need not be modified if the folder structure is as mentioned above under Setup.
`run/logs` contains all the stdout and stderr out put redirected per project.
`run/pids` contains all the pids of the linux processes that are started.

`scripts` contain the individual scripts that will be called repeatedly. These can also be called individually per project (or module) if all the projects are not required to be deployed.


## Build

From the `run` folder, run 
> ./build-all.sh

This script builds the individual projects and copied over the build jar files, per project, to `artifacts` folder which is at the same level as `run`.

## Deployment on remote server.

ssh into the remote server

> ssh digit

> cd dev/build/run

Stop all the services on the remote server.
> ./shutdown-all.sh

The artifcats need to be copied over to the remote server using scp or any other compatible software.

For scp, type the following from the root of the project

> scp -r artifacts digit:dev/build/artifacts

Start them all up.

> ./start-all.sh

## Troubleshooting

1. Look up the logs to see which service is failing.
2. If failing due to postgres, launch a postgres shell on remote server.
> sudo -u postgres psql