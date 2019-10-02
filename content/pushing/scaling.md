+++
title = "Scaling"
weight = "3"
+++

At the end of the last exercise, you modified the deployment config by changing the app name. Let's modify more of the deployment config to illustrate how you can scale applications in Cloud Foundry.

## Horizontal Scaling

When you scale an application horizontally, you are manipulating the number of instances of that application up or down. In Cloud Foundry, horizontal scaling does not result in downtime as traffic is only routed to available instances. When new instances are created, traffic is not routed to them until they pass a health check.

Scale your app up to two instances:

```
cf scale -i 2 static-app
```

## Vertical Scaling

When you scale an application vertically, you are manipulating the resources allocated for each application instance container. In Cloud Foundry, you can change the memory and disk allocations. 

Let's scale your app instances down in both disk and memory.

```
cf scale -m 48M -k 256M static-app
```

What happened? Scaling vertically involves downtime as the containers are recreated with different resource allocations. This is an important consideration before scaling vertically in production.

You can see these allocations using `cf apps` or `cf app static-app`.
