#!/bin/bash

set -e

if [ "$1" = "" ]; then
  echo $0: usage: $0 concourse-target
  exit
fi

target=$1

this_directory=`dirname "$0"`

fly -t ${target} set-pipeline -p cfcd-prep-site -c ${this_directory}/pipeline.yml