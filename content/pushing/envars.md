+++
title = "Environment Variables"
weight = "5"
+++

In this section, we will review environment variables and how to use them.

## Preparation

We have provided another application written in golang that will display some information about the app including environment variables. 

Use the supplied manifest to deploy the training app located in `push/training-app`. Name the app `training-app`. 

```
cd ../training-app
cf push training-app -f manifest.yml -p training-app.zip --random-route
```

{{% notice tip %}}
Note the use of the `--random-route` flag. On the exam, you are responsible for ensuring your apps do not have route collisions.
{{% /notice %}}

Access the app in a browser and make sure you see the interface. You will notice it is not displaying any environment variables.

## Setting environment variables

This app will display any environment variable that starts with `TRAINING_`. Set some environment variables (but don't restart or restage yet):

```
cf set-env training-app TRAINING_KEY_1 training-value-1
cf set-env training-app TRAINING_KEY_2 training-value-2
cf set-env training-app TRAINING_KEY_3 training-value-3
```

Notice the CLI provides a tip: `TIP: Use 'cf restage training-app' to ensure your env variable changes take effect`. If you access your app in a browser before restarting/restaging you will see why; the app does not see the new environment variables yet.

Now restart the app and view it in a browser (we will discuss restart vs restage in a later section). You should see the two envars you set above. 

```
cf restart training-app
```

## Inspecting environment variables

Most apps do not (and should not) show environment variables in their publicly accessible UI. However, you can use `cf env` to inspect the environment variables and values. 

```
cf env training-app
```

{{% notice tip %}}
Be sure you have restaged or restarted your app so the app sees the same values you see when using `cf env`. If you have not restaged or restarted after environment variables were changed in the deployment config, `cf env` will show the latest values while the app will only see and display the older values.
{{% /notice %}}

## Updating environment variables

You can change an environment variable value by using `cf set-env` and providing a new value:

```
cf set-env training-app TRAINING_KEY_3 training-value-3_1
```

Remember to restart the app to see the change.

### Adding environment variables to the manifest

To ensure the environment variables are always configured correctly on a push, be sure to add them to the manifest. The app already has one environment variable set called `GOPACKAGENAME`. 

{{% notice tip %}}
Be extra careful if you need to edit a manifest during the exam. Yaml can be quite finicky. We recommend you are very careful about using spaces (not tabs) for indentations. Remember, you can always have Cloud Foundry generate a manifest for you. However, you may still need to add/edit values by hand that Cloud Foundry is unaware of. And remember you can always delete the app and re-push using the manifest to test your changes during the exam. 
{{% /notice %}}

### Unsetting environment variables

To remove an environment variable in CF, you *must* use `cf unset-env`. Because you can set variables via the CLI or a manifest, simply removing a value from a manifest and re-pushing will *not* work. You must unset the value and remove it from the manifest.

```
cf unset-env TRAINING_KEY_1
```

## Special environment variables

When you read environment variables inside code, you will notice that there are many more than the user provided values you set. Cloud Foundry also injects configuration for your application via environment variables. Two common variables are VCAP_APPLICATION (which provides configuration and information about the application instance) and VCAP_SERVICES (which provides configuration for accessing service instances). 
