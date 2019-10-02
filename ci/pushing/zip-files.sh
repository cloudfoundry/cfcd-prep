#!/bin/bash

set -e

. ci/ci/common/common.sh

cf_login

wget ${SITE_URL}/cfcd-prep.zip

unzip cfcd-prep.zip

pushd cfcd-prep/push/zip-file
	# Push zip w/ source path
	app_name="zip-with-src-path"
	cf push ${app_name} -p app.zip -b staticfile_buildpack -m 64M --random-route 
	route=$(get_first_route ${app_name} ${CF_APP_DOMAIN})
	# Expect curl works and shows cf logo
	expect=$(curl https://${route} | grep "cf-logo.png")
	[[ ! -z ${expect} ]] || c
	# Push zip w/o source path
	app_name="zip-no-src-path"
	cf push ${app_name} -b staticfile_buildpack -m 64M --random-route
	route=$(get_first_route ${app_name} ${CF_APP_DOMAIN})
	# Expect a 403 error
	expect=$(curl https://${route} | grep "403 Forbidden")
	[[ ! -z ${expect} ]] || (echo "Expected page (https://${route}) to contain: 403 Forbidden" 1>&2 && exit 1)
	# Expect the zip file to be downloaded
	mkdir download
	cd download
	wget https://${route}/app.zip 
	[[ -f "app.zip" ]] || (echo "Expected file app.zip to be downloaded from https://${route}/app.zip" 1>&2 && exit 1)
	cf d -f -r zip-no-src-path
	cf rename zip-with-src-path static-app
popd