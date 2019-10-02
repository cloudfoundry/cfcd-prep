#!/bin/bash

cf_login() {
	echo "Logging into Cloud Foundry"
	cf api $CF_API
	cf auth 
	cf target -o $CF_ORG -s $CF_SPACE
}

get_first_route() {
	local app_name=$1
	local domain=$2
	local app_guid=$(cf app --guid ${app_name})
	local summary=$(cf curl -f /v2/apps/${app_guid}/summary)
	local hostname=$(echo $summary | jq -r '[.routes[] | select(.domain.name == "'"${domain}"'") | .host][0]')
	echo "${hostname}.${domain}"
}