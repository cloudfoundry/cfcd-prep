+++
title = "Source Paths"
weight = "2"
+++

Let's review how to specify where to find the application content when pushing applications.

## Specifying a directory

When you run the `cf push` command , you can use the `-p <directorypath>` parameter to specify the location of the directory containing the application content. 

You can also specify the path in a manifest file called `manifest.yml`:

```
---
  ...
  path: /path/to/app/bits
```

The `-p` parameter takes precedence, overriding any path specified in a manifest file.

{{% question %}}What happens when you push without specifying a path (either in a manifest or using `-p` parameter)?{{% /question %}}

The CLI will push the contents of your current working directory. This is typically a bad idea as unexpected things can happen (like pushing a folder of your home videos).

## Specifying a ZIP file

Cloud Foundry also supports pushing a zip file containing your app code. The `push/zip-file/` directory contains a zipped up app.  Let's push it. Be sure you are in the `push/zip-file` directory.

```
cf push zip-with-src-path -p app.zip -b staticfile_buildpack -m 64M --random-route 
```

If you access the app in a browser, you will see the Cloud Foundry logo.

{{% question %}}If your current directory only contains a zip file, can you push without specifying the path?{{% /question %}}

Not if you want Cloud Foundry to unzip the file before staging. What happens when you do this will depend on the specific buildpack you are using. Let's try it with the staticfile buildpack and see what happens. Be sure you are in the `push/zip-file` directory.

```
cf push zip-no-src-path -b staticfile_buildpack -m 64M --random-route
```

If you access this app in a browser you see a 403 error. If you access the URL and append `/app.zip`, you will download the app package. 

When you omitted the path, Cloud Foundry didn't unzip the files, and the staticfile buildpack assumed you wanted to pass the entire directory contents during staging, even though it contains only a single file. 

### Cleanup

Before proceeding, let's clean up a little. We could delete the `zip-no-src-path` app:

```
cf delete -f -r zip-no-src-path
```

However, we can also use the `zip-with-src-path` app for the next section. Let's rename the app to something better.

```
cf rename zip-with-src-path static-app
```

## Available Buildpacks

Above, we told you to use the `staticfile_buildpack` in the push command. However, you should also know how to see what buildpacks are available to you in the Cloud Foundry instance you are using. You can do this using

```
cf buildpacks
```

