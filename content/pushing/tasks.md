+++
title = "Tasks"
weight = "7"
+++

A task is an app or script whose code is included as part of a deployed app, but runs independently.

In contrast to an app (a long-running process), tasks run for a finite amount of time, then stop. Tasks run in their own isolated containers that share the application's deployment config. After a task runs, Cloud Foundry destroys the container running the task.

Tasks can be used for a multitude of reasons. Common uses for tasks include as database maintenance and migration tasks, indexing, backups, report generation, etc. 

## Running a Task

The training-app contains a task that will dump all environment variables to standard output. The task is a simple bash script that invokes the `printenv` command. The task is packaged as part of the app code and is included in the `tasks` directory. If you unzip the `training-app.zip` source you will see this script.

You can run the task using `cf run-task`. With this command you can specify the amount of disk and memory allocated to the tasks' container. Given our task is lightweight, we can allocate few resources:

```
cf run-task training-app -m 8M -k 64M --name printenv --command "tasks/printenv.sh"
```

You will notice we also assigned a task name `printenv`. Like an app name, this is a human readable name used to reference the task inside Cloud Foundry. Cloud Foundry will assign a task id and queue the task for execution.

### Task Status

The execution of tasks is asynchronous. Some tasks may run quickly while others may take hours. For this reason, it is useful to check on the status of a task.

```
cf tasks training-app
```

You should see your task has completed successfully. If necessary, you can also terminate a task using the CLI.

### Task Logs

So where is the output of our `printenv` execution? In the logs, of course. You can see the output of the task (the environment variable dump) by looking in the logs.

```
cf logs --recent training-app
```

Here you will see all of the environment variables including those set by Cloud Foundry.

{{% notice warning %}}
Dumping environment variables to log files is typically not a good idea as secrets will end up in the logs. We are doing this solely for training purposes.
{{% /notice %}}
