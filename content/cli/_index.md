+++
title = "Command Line Interface"
weight = "2"
chapter = "true"
pre = "<b>2. </b>"
+++

# Command Line Interface (CLI)

The Cloud Foundry Command Line Interface (or CLI) is used to interact with Cloud Foundry deployments. The CF CLI exposes logical commands to users of the platform. The CF CLI primarily makes REST calls to the Cloud Controller in a Cloud Foundry deployment to carry out commands. Often a single command results in more than one REST request and response.

The CF CLI is **common core**, meaning it works with Cloud Foundry deployments and distributions that do not deviate from compatibility with the core Cloud Foundry components. The CLI should work with any Cloud Foundry deployment that's running a supported version of the Cloud Foundry API.