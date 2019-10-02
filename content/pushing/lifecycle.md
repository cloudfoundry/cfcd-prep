+++
title = "Lifecycle"
weight = "8"
+++

Let's dig a little deeper into the application lifecycle events in Cloud Foundry.

## Restarting, Restaging, and Re-pushing

To run an application in Cloud Foundry, you provide the app code and app config, the platform creates a droplet (app + runtime dependencies), and the platform runs each app instance inside a container according to the deployment config. 

When managing applications in Cloud Foundry, you may be faced with the need to restart, restage or re-push the application to make changes. Let's make sure you know what each does and when to use it.

### Restarting

Restarting is the least disruptive of the three operations. When restarting an app, Cloud Foundry will destroy the existing container instances and create new ones. The existing droplet and the existing config are used when creating the new instances.

You can restart when you know the droplet content won't change, but you want the application processes to be recycled. Note that users of the application will see downtime while the container instances are recreated, although this is typically a quick process (on the order of seconds). 

#### Restarting a Single Instance

Sometimes you might want to restart a single application instance at a time to minimize the amount of downtime that users see. For example, if your application is running in n instances, you could restart each instance of your app one at a time. This would reduce the likelihood of users seeing downtime since there's always at least one healthy instance handling their requests.

```
cf restart-app-instance static-app 0
```

Of course, you have to have more than one instance for this to work.

{{% question %}}Why should you restart an instance after ssh-ing to it?{{% /question %}}

Let's see why. What happens if we do the following?

```
cf ssh static-app -i 0
```

Then in the container session:

```
rm -fr app
exit
```

`rm -fr app` will recursively delete the app directory. This is bad, right? It is also unlikely that you would do this. If you do this and access the static-app multiple times in a browser, responses served by instance `0` will fail.

We were explicitly destructive here, but The point is that you might change something you don't intend to when accessing a container via ssh. To fix this, simply use restart to destroy the container instance you accessed and get a fresh container instance. 

### Restaging

When you restage an app, you are asking Cloud Foundry to create a new droplet. The staging process uses the same application code from when you last pushed. The app config and deployment config don't change as a result of restaging.

Note the Cloud Foundry, as of V2, stops the application while restaging it. Users of the application will see downtime on the order of minutes while the staging process runs. 

You need to restage when runtime dependencies *might* change but your app code has not changed. This could happen when you change an environment variable directly or bind a service instance. If the config change or binding could result in different runtime behavior, you should restage.

A common scenario is binding a monitoring service that includes an agent in the runtime (AppDynamics, NewRelic, etc). In such cases, the agent needs to be added to the droplet during staging so that it will run in the same container process as the app code. In this case, a restart will not be sufficient because the buildpack will not add the necessary agent.

{{% notice info %}}
When you change the environment variables directly or by adding or removing service bindings, the CLI recommends restaging. It recommends a restage instead of a restart because the CLI does not know if the change will affect the staging process. For this reason, the recommendation is based on the *possibility* the environment change will result in a changed droplet. If you know for sure that the changes to the environment are only used by your application and not the staging process, a restart will suffice.
{{% /notice %}}

Another common restage scenario is when the stack is changed. Because it is difficult to know for sure if changed stack elements are in use by a runtime, restaging after changing the stack is a common practice performed by the platform.

### Re-pushing

Re-pushing is necessary when your application code changes.

When you re-push an application to Cloud Foundry, you are overwriting *almost* everything related to the app. The cached app code is replaced with whatever you push. This new app code is sent through the staging process causing a new droplet to be created. Lastly, each existing container (instance) is destroyed and replaced with a new one using the new droplet.

The deployment config *might* change. It depends on if you change it. Existing values will only be overwritten if new values are provided. If you omit values, the existing ones will be used.

When re-pushing with a manifest, the app config *might* change. Environment variables will be overwritten if new values are provided.
