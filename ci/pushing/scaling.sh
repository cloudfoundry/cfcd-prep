#!/bin/bash

set -e

. ci/ci/common/common.sh

cf_login

cf scale -i 2 static-app

app_guid=$(cf app --guid static-app)
summary=$(cf curl -f /v2/apps/${app_guid}/summary)

[[ $(echo "$summary" | jq -r '.instances') == 2 ]] || (echo "Expected 2 instances" 1>&2 && exit 1)

cf scale -f -m 48M -k 256M static-app

summary=$(cf curl -f /v2/apps/${app_guid}/summary)

[[ $(echo "$summary" | jq -r '.memory') == 48 ]] || (echo "Expected 48M of memory" 1>&2 && exit 1)
[[ $(echo "$summary" | jq -r '.disk_quota') == 256 ]] || (echo "Expected 256M of disk" 1>&2 && exit 1)
