+++
title = "Manifests"
weight = "4"
+++

Now that we have our static app deployed and configured, it is useful to standardize the config provided on future pushes. You can use a manifest file to specify the exact values you want for all configurable parameters. Using a manifest file is a good practice because it can be captured in version control, and it also reduces the number of parameters you need to specify to the CLI every time you push.

## Creating Manifests via the CLI

You *can* write a manifest from scratch manually, but that requires a fair amount of yaml wrangling. Instead, Cloud Foundry can create a manifest based on what is currently deployed. Use the CLI to create a manifest for your static app:

```
cf create-app-manifest static-app
```

A manifest file will be created in your current directory. Notice the name is `static-app_manifest.yml`, not `manifest.yml`, named after the app. When using this manifest on a push you will have to supply the `-f` flag (or rename the file to `manifest.yml`, which is the default that the CLI will use).

### Testing the Manifest

Now that you have a manifest, you can test it by deleting the app, then re-pushing it.

```
cf delete -f -r static-app
cf push -f static-app_manifest.yml
```

{{% question %}}What happened? Did the deployment work? Were you able to access the app?{{% /question %}}

If you used the commands above, the app did not deploy correctly. When you open the app route in a browser, you will see a 403 error. This is the same error you saw in the `Source Paths` section. Open the manifest and see if you can figure out what's wrong. (As practice for the exam, we recommend you use one of the Unix tools that will be available). 

{{% question %}}What config elements are included and what are missing?{{% /question %}}

Cloud Foundry can only include the config elements it knows about. You will notice the `stack` property was added. You didn't specify this when you pushed the app originally, but Cloud Foundry set it as the default value. However, the path to the app.zip file is missing. This is because Cloud Foundry doesn't know the path you used on your local filesystem. You can fix this by adding the path to the manifest, or by pushing with the `-p` parameter. How you chose to fix this will depend on your use-case. For now, let's push with the `-p` parameter:

```
cf push -f static-app_manifest.yml -p app.zip
```

Make sure the app now works correctly.

## CLI vs Manifest Precedence

When working with manifests, you can override values on the command line. Values specified with parameters will override any specified in a manifest. You can test this by re-pushing but specifying a different disk allocation.

```
cf push -f static-app_manifest.yml -p app.zip -k 128M
```

{{% notice tip %}}
If you want to make this change permanent, you need to make it in the manifest. Otherwise, the next time you push the manifest without using the parameter, it will overwrite the value to the one specified in the file.
{{% /notice %}}

You can also explicitly ignore the manifest when pushing using the `--no-manifest` flag.
