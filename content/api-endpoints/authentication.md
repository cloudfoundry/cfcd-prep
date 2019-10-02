+++
title = "Authentication"
weight = "2"
+++

Here are the options for providing credentials to the CF CLI for authentication to an API endpoint.

{{% notice warning %}}
Your command shell keeps a history of the commands you run. Therefore, you should be careful when you provide credentials to  command-line programs.{{% /notice %}}

## Interactive Authentication

`cf login` can be used in both interactive and non-interactive mode. To use interactive mode, omit flags and you will be prompted to provide input. In this mode, your sensitive information (password) is *not* stored in the command shell history. You can see this by running:

```
cf login
```

You will be prompted to provide a username and password. If you scroll through the command shell history (using the up-arrow key), you will see the `cf login` command but will not see your username or password.  

### One-time Passcodes

`cf login` also supports single use (one-time) passcodes. This flow directs you to authenticate via a web browser to obtain a passcode. You then paste this passcode into the terminal window. Because you are authenticating via a browser, you have mitigated the risk of your password ending up in the command shell history. 

You can try this via:

```
cf login --sso
```

The CF CLI will output a URL. You should copy and paste this in a browser, where you'll be prompted to authenticate in exchange for a passcode. You can copy and paste the passcode provided into the terminal window to complete authentication.

{{% notice warning %}}
The one-time passcode flow requires you to open pages in a browser. For this reason, you should **not** use `cf login --sso` on the exam as it may take you to a non-approved URL.
{{% /notice %}}

## Non-Interactive Authentication

Non-interactive authentication should be used when automating interactions with Cloud Foundry (such as in CI/CD implementations). This can be achieved using `cf auth` or `cf login` with parameters. 

With `cf auth`, you can set the `CF_USERNAME` and `CF_PASSWORD` environment variables or you can pass in a username and password as parameters. However, using the environment variables is typically preferred, provided you can set them without adding them to the command shell history where the automation is running. 

## Logging Out

When you authenticate with Cloud Foundry, the CLI caches a token locally on your machine. As you make requests (like pushing an app), the CLI is including this token in your requests. By doing this, you do not have to authenticate on every request. This means you can continue to work and will only need to re-authenticate when your token expires and can't be refreshed. However, this also means you need to be mindful to log out when appropriate to ensure someone cannot use your computer for nefarious purposes.

If you run `cf target`, you will see that you are authenticated. You can then log out using:

```
cf logout
```

If you re-run `cf target`, you will see you are no longer logged in.
