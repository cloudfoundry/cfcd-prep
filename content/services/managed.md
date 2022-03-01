+++
title = "Managed Services"
weight = "1"
+++

Managed services are advertised in the marketplace and available for self-service, on-demand provisioning. 

Service brokers are responsible for advertising the available services and plans available to the marketplace, provisioning and deprovisioning service instances, and generating and revoking credentials used in service bindings.

## The Marketplace

The marketplace is where you can see services available for provisioning. You can view all services available to you:

```
cf marketplace
```

The list of marketplace services can be long. Since the exam is taken on a Unix-based system, you can use `grep` to search the list and narrow it down. Let's say we are looking for a RabbitMQ service. We could pipe the output of `cf marketplace` into grep:

```
cf marketplace | grep RabbitMQ
```

Note that services offered and the names of services can vary between Cloud Foundry deployments. You may have to replace `RabbitMQ` in the command above with the name of a service offered in your Cloud Foundry.

Once you have identified the service offering you are looking for, you can see the details of that offering with:

```
cf marketplace -e <SERVICE_OFFERING>
```

You will see details about each plan (or tier) the broker is making available. 

### Creating/Provisioning service instances

Once you know what services are available, you can provision (create) a service instance using a specific plan. Again, the `<SERVICE_NAME>` and `<PLAN>` will vary depending on what is availabe in the Cloud Foundry instance you are using. 

*If RabbitMQ isn't available to you, pick another service. The selection of RabbitMQ is arbitrary in this example. We will continue to reference RabbitMQ for simplicity in the rest of the exercise.*

```
cf create-service <SERVICE_NAME> <PLAN> rabbitmq
```

You can see the service instances available in the space by running:

```
cf services
```

### Binding a service instance

Binding is the process of generating credentials (config) for a service instance and making them available to an application through the `VCAP_SERVICES` environment variable. You can bind the service instance to your app using (do not restage or restart yet):

```
cf bind-service training-app rabbitmq
```

You can view the binding and the configuration by inspecting the `VCAP_SERVICES` environment variable:

```
cf env training-app
```

If you access the training app in a browser, you will see the app does not yet know about the new service instance. Remember you need to restart (or restage) the application first so that it picks up the config change in the evironment.

```
cf restart training-app
```

Now if you access the app in browser you should see the service instance information listed.

### Unbinding a service instance

The process to unbind a service instance is similar to binding:

```
cf unbind-service training-app rabbitmq
```

If you inspect the environment you will see the config removed from the `VCAP_SERVICES` environment variable:

```
cf env training-app
```

However if you access the app in a browser, you will see it still knows about the service instance. To update the config, you need to restart (or restage):

```
cf restart training-app
```

Accessing the app in a browser now shows it no longer knows about the service instance.

### Deleting/Deprovisioning a service instance

A service instance may be bound to more than one application or it may not be bound to any applications. The process of unbinding only removes access for a previously-bound application; it does not delete the service instance or any data that it holds. 

To deprovision and delete an instance completely, you can use:

```
cf delete-service rabbitmq
```

This will tell the broker it is ok to delete the service instance completely. Note that you cannot delete a service instance that is still bound to an application. Service instances have to be unbound from all applications before deleting them. 
