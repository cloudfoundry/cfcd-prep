+++
title = "Logs"
weight = "6"
+++

As a developer, you will need to access logs for your application instances. This is especially helpful when debugging issues.

## Following logs as they happen


Cloud Foundry provides the ability to stream logs in near real-time.

```
cf logs training-app
```

You will see no output until you access your app. Once you generate traffic, you will see logs appear. When accessing the training app, you will see logs from the Cloud Foundry routers tagged with `[RTR/<some-index>]`.

You can exit streaming with `CTRL-c`, or you can continue to stream and start a new terminal window. However, on the exam you only have one terminal window.

## Inspecting recent logs

You can view recent logs for an app as well. 

```
cf logs --recent training-app
```

The `recent` buffer is finite in both space and time. Therefore if your app has been idle for a long period, you may not see anything in the recent logs.

## Troubleshooting

Logs are incredibly useful when troubleshooting issues.  Common issues are running out of memory, route collisions, or pushing the wrong application payload.
