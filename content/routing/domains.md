+++
title = "Domains"
weight = "2"
+++

So far, we have used the default app domain for routing to our apps. However, other domains are available for our use as well. You can see the list of available domains in a given space by running:

```
cf domains
```

## External Domains

External domains are routable from outside of Cloud Foundry. The default app domain we have used so far is an example of such a domain. Any app that needs to be accessible from outside of Cloud Foundry will need to be on an external domain.

{{% question %}}
What external domains are available in the Cloud Foundry instance you are using?
{{% /question %}}

Remember you can see the available domains via `cf domains`. Any domain not labeled as `internal` is an external domain.

### HTTP vs TCP Domains

When listing domains, you may notice domains of type `tcp`. Domains without a type are for http traffic while `tcp` domains are only for TCP traffic. `tcp` routing is outside the scope of the exam.

## Internal Domains

For security purposes, it is desirable to have some applications be inaccessible from outside of Cloud Foundry. This might include any sort of back-end RESTful data services or webapp. Routes based on internal domains are only resolvable by other apps in that same Cloud Foundry deployment. 

Each Cloud Foundry deployment has a default internal domain `apps.internal`. You can create routes on this domain and map them to your applications.

### Creating a Route on the Internal Domain

Let's move the `static-app` to the internal domain. Creating a route is the same regardless of the domain. We can create and map the route in one command:

```
cf map-route static-app apps.internal --hostname <SOME_UNIQUE_HOSTNAME>
```

At this point, the app is still routable from the external domain as well. We can remove this route by unmapping it:

```
cf unmap-route static-app <CF_APPS_DOMAIN> --hostname <HOSTNAME>
```

### Container-to-Container Networking

At this point, the static-app is only routable from inside of Cloud Foundry. However, Cloud Foundry will prevent any app from accessing the static app unless we explicitly allow it through a network policy. This prevents apps that might be deployed by others from accessing internal apps without explicit permission. We can test this by using `cf ssh` in the training app and attempting to curl the static app:

```
cf ssh training-app -i 0
```

Then from inside the training app (note the default port for internal apps is 8080):

```
curl <STATIC_APP_ROUTE>:8080
```

You will see a `Connection Refused` error. This is because Cloud Foundry is blocking the request. We must explicitly allow this by adding a network policy.

```
cf add-network-policy training-app static-app
```

Now, if you retry the curl from inside the training-app container, you should see it succeed:

```
curl <STATIC_APP_ROUTE>:8080
```

It's also possible to enable access to internal applications across spaces and orgs by providing the `-s` and `-o` parameters.
