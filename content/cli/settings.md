+++
title = "Settings"
weight = "2"
+++

## Internationalization

The CLI supports text display in multiple languages. For the most up to date information on supported languages, see [the Cloud Foundry docs](https://docs.cloudfoundry.org/cf-cli/getting-started.html#i18n).

To change the locale in use, you can run:

```
cf config --locale <LOCALE>
```

Using a locale of `CLEAR` will remove any value set previously.

## Tracing Requests and Responses

The CLI makes REST calls to the Cloud Controller, often multiple calls for a single command. It can be helpful to see the requests and responses while debugging or when working directly with the API. There are multiple ways you can enable debugging:

* Setting the `CF_TRACE` enviroment variable to `true` will output the requests and responses in your command window as they are sent and received.
* The same type of request/response logging can be enabled using `cf config --trace=true`.
* Requests and responses can also be logged to a file by setting the `CF_TRACE` environment variable to the name of a file.

