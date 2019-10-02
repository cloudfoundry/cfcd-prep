+++
title = "User-Provided Service Instances"
weight = "3"
+++

A user-provided service instance (UPSI) is a service instance where the credentials (config) are provided by a user, not a broker. The provisioning of any resources related the service instance also happen outside of a broker. A user-provided service instance is essentially a set of key/value pairs provided to an application.

The application uses the config (bindings) injected via the `VCAP_SERVICES` variable to interact with service instances. Typically apps will not make distinction between a service instance provisioned by a broker and a user-provided service instance.

## Creating

You can create a service instance using the `cf create-user-provided-service` (or `cf cups`) command. `cf cups` supports both a non-interactive mode and an interactive mode. We will look at both.

Let's assume we want to create two user-provided service instances, one named `non-interactive` and one named `interactive`. Each will have three keys: `user`, `password` and `url`.

To create a UPSI named `non-interactive` in non-interactive mode, you provide well-formed JSON using the `-p` flag:

```
cf cups non-interactive -p '{"user":"some-user", "password":"some-password", "url":"some-url"}'
```

{{% notice info %}}
The above JSON format is well-formed and works on Unix-based systems including the exam terminal. The format *might* vary if you are using a Windows terminal and will depend on the specific Windows terminal you are using. You can consult the CLI help text for appropriate formats on Windows and necessary escape sequences.
{{% /notice %}}

To create a UPSI named `interactive` in interactive mode, you provide the key names using the `-p` flag:

```
cf cups interactive -p "user, password, url"
```

The CLI will prompt you to provide values for each of the keys. This mode is useful if you are uncomfortable providing well-formed JSON.

You should be able to see both of your service instances when running `cf services`.

## Inspecting

You can view the values of a user-provided service instance by binding it to an application and then inspecting the environment variables for that application. The process of binding a UPSI is exactly the same as binding a service instance provisioned by a broker. Let's bind and inspect both instances created above:

```
cf bind-service training-app non-interactive
cf bind-service training-app interactive
cf env training-app
```

You should see both instances and their key/value pairs listed under the `VCAP_SERVICES` environment variable. However, if you access your training app in a browser, it will not yet see this new config. You will need to restart (or restage) first:

```
cf restart training-app
```

Now if you access the app in a browser you should see both instances listed.

## Updating

Updating a UPSI is very similar to creating one, except the command is `cf update-user-provided-service` (or `cf uups`). Just as when creating, you can do so interactively or non-interactively.

When you update a user-provider service instance, you are overwriting *all* values, not patching. You must provide all key/values to the update command. For this reason, it is good practice to inspect a UPSI before updating it. By doing so, you will have the old values in your terminal window's history as reference.

Let's update the `url` value of the `interactive` upsi:

```
cf env training-app
cf uups interactive -p "user, password, url"
```

For the `user` and `password` fields, you should use the same values as before. For the new `url` feel free to provide anything you want.

If you again inspect the environment of the training-app you should see the change. 

```
cf env training-app
```

However, you app won't see the change until it is restarted (or restaged).

```
cf restart training-app
```

## Binding/Unbinding/Deleting

As you saw above the process of binding a UPSI is exactly the same as with a service instance provisioned by a broker. The same is true for unbinding and deleting (we covered this in a previous section). Therefore if we want to unbind and delete the `non-interactive` instance we need to do the following:

```
cf unbind-service training-app non-interactive
cf restart training-app
cf delete-service non-interactive
```

You should be able to run `cf services`, inspect the app's environment and access the app in a browser to confirm the UPSI is no longer available in the app or your space.
