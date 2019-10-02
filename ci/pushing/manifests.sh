#!/bin/bash

set -e

. ci/ci/common/common.sh

cf_login

wget ${SITE_URL}/cfcd-prep.zip

unzip cfcd-prep.zip

pushd cfcd-prep/push/zip-file

	cf create-app-manifest static-app
	cf delete -f -r static-app
	
	# push w/o path
	cf push -f static-app_manifest.yml
	route=$(get_first_route static-app ${CF_APP_DOMAIN})
	# Expect a 403 error
	expect=$(curl https://${route} | grep "403 Forbidden")
	[[ ! -z ${expect} ]] || (echo "Expected page (https://${route}) to contain: 403 Forbidden" 1>&2 && exit 1)

	# push w/ path
	cf push -f static-app_manifest.yml -p app.zip
	# Expect curl works and shows cf logo
	expect=$(curl https://${route} | grep "cf-logo.png")


	cf push -f static-app_manifest.yml -p app.zip -k 128M
	# Expect curl works and shows cf logo
	expect=$(curl https://${route} | grep "cf-logo.png")

	app_guid=$(cf app --guid static-app)
	summary=$(cf curl -f /v2/apps/${app_guid}/summary)

	[[ $(echo "$summary" | jq -r '.disk_quota') == 128 ]] || (echo "Expected 128M of disk" 1>&2 && exit 1)
popd