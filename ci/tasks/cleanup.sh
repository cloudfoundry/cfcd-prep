#!/bin/bash

set -e

. ci/ci/common/common.sh

cf_login

cf d -f -r static-app

