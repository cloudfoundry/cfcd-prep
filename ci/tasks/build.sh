#!/bin/bash

set -ex

version=`cat version/version`

echo "Building site version: ${version}"

echo 'version = "'${version}'"' >> source/config.toml

# build it
cd source

cat config.toml

hugo

# add apps
mkdir cfcd-prep 
cp -R apps/* cfcd-prep
zip -r cfcd-prep.zip cfcd-prep -x "*.DS_Store"
mv cfcd-prep.zip public

# package it
pushd public
	zip -r cfcd-prep-${version}.zip * -x "*.DS_Store"
	mv cfcd-prep-*.zip ../../site
popd