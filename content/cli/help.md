+++
title = "Help"
weight = "1"
+++

## Documentation

The CLI is extensively self-documenting. Because the CLI is installed in the web-based terminal, help is available during the exam. Be sure you know how to use it.

To summarize:

* `cf help` displays help for the most frequently used commands
* `cf help -a` display help for all the available commands.
* `cf <command> -h (or --help)` displays the detailed help for executing a particular command.

{{% question %}}What happens if you run `cf push` expecting to see the help text?{{% /question %}}

If you run `cf <command>` without the necessary parameters, the CLI will output the detailed help text as if you ran `cf <command> -h`. However, leaving off the `-h`  and assuming the CLI will always output the help text is risky. For example, if you were to run `cf push` expecting to see the help text and a manifest exists in your current directory, you would potentially push an application unintentionally.

## Aliases

Many commands offer aliases (for example `cf m` as a shortcut for `cf marketplace`). Aliases are listed in the help descriptions.

