+++
title = "Zero-downtime Updates & A/B Testing"
weight = "3"
+++

The routing capabilities in Cloud Foundry enable very powerful patterns such as A/B testing and zero-downtime (or blue/green) updates. 

## Zero-downtime Updates

A zero-downtime update in Cloud Foundry is accomplished using a blue/green deployment pattern. The colors blue and green help describe what is happening. An application, Blue, needs to be updated. A new version, Green, is therefore deployed as a separate application. Green can be verified before we begin to route traffic to it. Traffic to Blue can be cut off when Green is receiving traffic.

The blue/green deployment pattern is a common method for avoiding application downtime during a restage or re-push operation.

## A/B Testing

In A/B testing, two versions of an application or feature are running at the same time, with each receiving some traffic. Customer behaviour with each version can be gathered and analyzed. 

## Implementation

We can demonstrate the A/B testing and blue/green update patterns at the same time, use the training app. 

Start by setting an environment variable named `TRAINING_COLOR` to `Blue` on your existing training app.

```
cf set-env training-app TRAINING_COLOR Blue
cf restart training-app
```

Access your training app in a browser to ensure you can see the environment variable. Now add the `TRAINING_COLOR = Green` environment variable entry to the manifest, and deploy a new version of the training app called `training-app-green`.

```
cf push training-app-green -f manifest.yml -p training-app.zip
```

Access `training-app-green` in a browser to ensure you can see the color environment variable.  Now, map the existing route for blue to green.

```
cf map-route training-app-green <CF_APP_DOMAIN> --hostname <BLUE_ROUTE>
```

If you access the BLUE_ROUTE in a browser a few times, you should see some requests going to blue and others to green. At this point, you are running an A/B test (two versions of the app/feature are availalble at the same route at the same time) where Blue is A and green is B.

{{% question %}}
How can you direct roughly 10% of traffic to version B of your application?
{{% /question %}}

If you wanted 10% of the traffic to go to green, you simply need to have 9 times the number of blue instances as green instances.

To finish off a blue/green deployment, you unmap the original (Blue) route from the blue app:

```
cf unmap-route training-app <CF_APP_DOMAIN> --hostname <BLUE_ROUTE>
```

This leaves all traffic going to green. You can verify this in a browser. At this point, you have deployed a new version of the app without any downtime. The blue version of the app can then be deleted.
