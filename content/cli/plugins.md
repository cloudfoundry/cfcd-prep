+++
title = "Plugins"
weight = "3"
+++

The CLI is extensible via plugins. Plugins are typically provided by the community rather than the core Cloud Foundry development teams.

## Plugin Repository

A plugin repository is available at: [https://plugins.cloudfoundry.org](https://plugins.cloudfoundry.org/). This repository lists plugins created by the community for a variety of tasks. 

These extensions are not built, maintained or sanctioned by the Cloud Foundry Foundation. Therefore you should research the plugins you intend to use and be aware of their quality and security impact.

## Installing Plugins

Plugins are installed via the `cf install-plugin` command. Plugins include documentation for newly-added commands, which you will see listed under a section labeled `INSTALLED PLUGIN COMMANDS` when you run `cf help -a`.
