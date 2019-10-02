+++
title = "Routes"
weight = "1"
+++

In Cloud Foundry, a route maps client traffic to a particular application. There is a many-to-many relationship between apps and routes. While the default behaviour on an initial application push is to create and assign a route, apps can have zero or more routes. Routes exist independently of apps, and routes can be mapped to zero or more apps.

## Domains

A route in Cloud Foundry is made up of a hostname and a domain. You can see the available domains by running: 

```
$ cf domains
```

Each Cloud Foundry deployment will have a default apps domain, labeled as such in the list above.

## Creating Routes

You can see all routes in your current space using:

```
$ cf routes
```

The `static-app` should still be running but it has a route that starts with `zip-with-src-path`. That route is cumbersome and strange so let's create a new one. You can create a new route using `cf create-route`:

```
$ cf create-route <YOUR_SPACE> <CF_APP_DOMAIN> --hostname <SOME_UNIQUE_HOSTNAME>
```

Routes are scoped to a space. Therefore, the first argument `<YOUR_SPACE>` above should be the space where your `static-app` is running. 

The second argument `<CF_APP_DOMAIN>` is the domain on which to create the route. Use the default apps domain for your Cloud Foundry instance. 

The last argument `<SOME_UNIQUE_HOSTNAME>` can be anything you want that is unique on that domain. You could try something like `static-app-YOUR_NAME`.

## Route Collisions

Routes must be unique within the Cloud Foundry deployment you are using. Route collisions occur when you try to reserve a route that already exists in another space in the Cloud Foundry deployment. This is why we have used the `--random-route` flag in this course, which generates a route name that is very unlikely to have already been specified by someone else.

{{% notice tip %}}
On the CFCD exam, you are responsible for ensuring your apps avoid route collisions. You can do this by assigning a unique hostname yourself or you can use the `--random-route` flag. Keep in mind that `--random-route` is not guaranteed to be unique (since someone else *could* specify the same route previously), and should be used judicously in real-world scenarios. 
{{% /notice %}}

## Mapping Routes

When you create a route, you are reserving that route for use within a space. Now that you have a route created, you can associate, or "map" it to your `static-app`.

```
$ cf map-route static-app <CF_APP_DOMAIN> --hostname <SOME_UNIQUE_HOSTNAME>
```

You can see the routes mapped to an app using:

```
$ cf app static-app
```

You should see the old route starting with `zip-with-src-path` and the new route you just created. You should be able to access your `static-app` via the new route or the old route.

## Unmapping Routes

If you want to get rid of the old route, you first need to unmap it from your static-app.

```
$ cf unmap-route static-app <CF_APP_DOMAIN> --hostname <OLD_HOSTNAME>
```

Replace `<OLD_ROUTE>` with the old route for your `static-app`. You can check that the route is no longer associated with the app via:

```
$ cf app static-app
```

## Deleting Routes

Now the old route is no longer associated with the app. However, the route still exists. You can see this by running:

```
$ cf routes
```

You can remove this route completely using:

```
$ cf delete-route <CF_APP_DOMAIN> --hostname <OLD_HOSTNAME>
```

You can verify the route has been deleted by re-running `cf routes`.

