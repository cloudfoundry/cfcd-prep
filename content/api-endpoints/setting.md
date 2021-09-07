+++
title = "Setting the Endpoint"
weight = "1"
+++

Before you interact with a Cloud Foundry deployment using the CLI, you have to set the API endpoint. You can do this either with the `cf api` command or as part of the `cf login` command. Go ahead and set your API endpoint using:

```
cf api <API_ENDPOINT>
```

You should be able to see the endpoint you set by running:

```
cf api
```

> Note: `cf target` will also show you your current API endpoint.

## The Exam API Endpoint

The API endpoint and credentials for the exam will be provided in a text file located in the home directory you access via the browser-based terminal window. 

{{% notice tip %}}
Remember you can view the contents of a file using `cat <some-file>`. You can use this command to view the contents of the credentials files.
{{% /notice %}}
