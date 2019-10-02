#!/bin/bash

credhub set -t value -n "/concourse/cfcd-prep/cf_staging_api" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_staging_user" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_staging_pwd" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_staging_org" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_staging_space" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_staging_hostname" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_staging_domain" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_staging_num_instances" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_staging_memory" -v ""

credhub set -t value -n "/concourse/cfcd-prep/cf_test_org" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_test_space" -v ""

credhub set -t value -n "/concourse/cfcd-prep/github_username" -v ""
credhub set -t value -n "/concourse/cfcd-prep/github_password" -v ""

credhub set -t value -n "/concourse/cfcd-prep/aws_artifact_bucket" -v ""
credhub set -t value -n "/concourse/cfcd-prep/aws_access_key_id" -v ""
credhub set -t value -n "/concourse/cfcd-prep/aws_secret_access_key" -v ""
credhub set -t value -n "/concourse/cfcd-prep/aws_region" -v ""


credhub set -t value -n "/concourse/cfcd-prep/cf_prod_api" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_prod_user" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_prod_pwd" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_prod_org" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_prod_space" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_prod_hostname" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_prod_domain" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_prod_num_instances" -v ""
credhub set -t value -n "/concourse/cfcd-prep/cf_prod_memory" -v ""



