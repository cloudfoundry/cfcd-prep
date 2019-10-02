+++
title = "Accessing the API"
weight = "3"
+++

## API versions

The Cloud Foundry API is constantly evolving. The [v2 API](https://apidocs.cloudfoundry.org) is what most users are familiar with. However, the development teams have been hard at work adding new capabilities via the [v3 API](https://v3-apidocs.cloudfoundry.org). You should have general awareness that these API versions exist.

## Accessing the API

You can interact with the Cloud Foundry API either via the CLI or directly via `curl` or another REST client. However, if you access the API via a means other than the CLI, you will have to manage the authentication token header yourself. By using the CLI, the api endpoint and authentication header will be managed for you.

### Using the CLI

Internally, the CLI is *usually* making one or more REST calls to the API. The CLI is a higher level abstraction, exposing capabilities like pushing apps. Pushing an app encompasses many lower level functions like uploading app bits, staging (droplet creation), droplet deployment in containers, and route management. Therefore, the capabilities in the CLI and API are different.

{{% notice info %}} We say the CLI is *usually* making REST calls, as there are a few cases where it is not. For example, tailing the logs opens a websocket connection after making REST calls to initiate the connection.{{% /notice %}}

### CLI & API Compatibility

The CLI and API are both **common-core** (standard across Cloud Foundry distributions). However, that doesn't mean all combinations of CLI + API Endpoint always work. The CLI and API, while related, are different projects evolving at different paces, with independent versions. Because Cloud Foundry deployments are updated at different paces (essentially updating the API version), it can be useful to ensure your version of the CLI works with a given Cloud Foundry deployment. You can do this by curling the API.

```
cf curl /v2/info
```

The above command uses the CLI to execute a curl request. Notice you do not have to specify the API endpoint as the CLI is inserting this for you. Therefore, the actual request is being sent to `https://<your-api-endpoint>/v2/info`. While this particular REST path does not require authentication, the CLI will include the correct authentication token header if the CLI has been authenticated with the API endpoint.

## When to use the API

Because the development of the CLI and API progress at different paces, new features may show up in the API before they are available in the CLI. In this case, you will need to use the API directly.

Additionally, the API should be used when automating interactions with Cloud Foundry (for example when implementing CI/CD pipelines). This is because the API both consumes and produces machine-readable structured data in the form of JSON. If you were to use the CLI commands directly and simply parse the output, your automation could break if the human readable output format of the CLI changes.  
