+++
title = "Service Keys"
weight = "2"
+++

Service keys can be used to generate a unique set of credentials for use outside of an application context. This can be useful if you need to connect directly to a database or hook up a monitoring tool does that not support service binding. Service keys are created by a service broker.

## Creating a Service Key

Let's create a service key for our rabbitmq service. We can pretend that these credentials will be used by a monitoring tool and name the key accordingly.

```
cf create-service-key rabbitmq monitoring-creds
```

The `rabbitmq` value is the name of our service. The `monitoring-creds` value is the name of the service key on our `rabbitmq` service. We gave the service key a descriptive name so the humans seeing it will have an idea of its intended purpose.

## Viewing Service Key Values

You can view the credentials of the service key using `cf service-key`:

```
cf service-key rabbitmq monitoring-creds
```

You can then use these credentials as you see fit (for example in our scenario, providing them to the monitoring tool).

## Deleting a Service Key

You can delete a service key using `cf delete-service-key`:

```
cf delete-service-key rabbitmq monitoring-creds
```

Since service keys are not bound to applications, no other actions are needed.
