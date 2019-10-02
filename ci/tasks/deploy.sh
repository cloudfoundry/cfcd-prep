#!/bin/bash

set -e

echo "Logging into Cloud Foundry"
cf api $CF_API


cf auth 
cf target -o $CF_ORG -s $CF_SPACE

cf push cfcd-prep-new -p artifact/cfcd-prep-*.zip -i ${NUM_INSTANCES} -m ${MEMORY} -b staticfile_buildpack -n ${HOSTNAME} -d ${DOMAIN}

cf delete -f cfcd-prep

cf rename cfcd-prep-new cfcd-prep