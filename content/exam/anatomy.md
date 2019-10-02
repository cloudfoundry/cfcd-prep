+++
title = "Anatomy of the Exam"
weight = "1"
+++

The Cloud Foundry Certified Developer examination is a 3-hour, proctored exam. The exam consists of 10 performance-based items and 10 multiple choice questions.

## Performance-Based Items

Performance-based items require you to complete tasks using Cloud Foundry. They test your practical ability to use the platform. Each performance-based item is graded based on a series of checks. The total score you receive for each item is the sum of each element that is checked. For this reason, you should **complete all elements of each performance-based item that you can**. Do not skip an entire item simply because you can't figure out part of it. Partial credit is better than no credit!

Some items are very direct about what needs to be done, while others are more vague. Be sure you follow the directions closely and pay attention to the details. If the item tells you to use a specific name for a thing, be sure you use *exactly* that name. This will help ensure you receive the highest score possible. 

{{% notice tip %}}
You can copy and paste from the exam interface to avoid introducing typos in names of elements.
{{% /notice %}}

Each performance-based item is crafted to allow you to check your work. Some of the sample applications provide endpoints to check your work. However, the endpoint is only one check. Be sure to inspect using the `cf` command to ensure you have completed each item according to the instructions.

## Multiple Choice Questions

Multiple choice questions are used to test additional topics not covered by the performance-based items. Multiple choice questions are used to test knowledge of concepts or when a performance-based item is not practical within the confines of the exam. This is typically true when an equivalent performance-based item would take too much time or be too difficult to grade. 

## Time

Candidates are given up to 3 hours to complete the exam unless special accomodations have been arranged ahead of time. 

## Scope

Cloud Foundry significantly reduces the complexity of deploying and managing applications. Version 2 of the certification exam reflects this. Said another way, the exam does not test the far reaches of Cloud Foundry. It is scoped to the typical day-to-day tasks and knowledge required of a developer using the platform.

As Chip Childers, CTO at Cloud Foundry Foundation states: “If you use Cloud Foundry with any regularity, you should pass the certification exam — it’s as simple as that.” 

### Domains and Competencies

CFCD v2.0 Domain & Competencies are outlined below. This is the list of competencies that are in scope for testing. Competencies may be on the list below but not show up on the exam.

**Application Lifecycle**

- Buildpacks
- Buildpack sources (system, git)
- Stacks
- Health checks
- Buildpack release notes

**Application Management**

- cf push
- cf start/stop/restart/restage
- cf delete
- cf app
- Scaling (horizontal/vertical)
- Application manifests

**Basics** 

- CLI
- CLI plugins
- Logging
- Targeting
- cf help
- Orgs & spaces
- cf curl
- Environment Variables

**Platform Security**

- Roles & Permissions
- Application security groups

**Routing**

- Route management
- Inter-application communication

**Services**

- Service brokers
- Managed services
- Service instance lifecycle & use
- User-Provided Service Instances
- Sharing service instances
- Space-scoped brokers
- VCAP_APPLICATION
- VCAP_SERVICES
- Service keys

**Troubleshooting**

- Container ssh
- Route confusion
- Out of memory
- CF_TRACE
- Troubleshooting service connectivity
- Route collision

### Programming Languages

Programming tasks and specific programming languages are not in scope. The exam tests your ability to use the Cloud Foundry platform as a developer, not your ability to write code.

## Allowable Resources

In addition to the testing interface detailed in the next section, you may have **one** additional browser tab opened during the exam. In that tab, you will be allowed to access:

- docs.cloudfoundry.org
- apidocs.cloudfoundry.org
- v3-apidocs.cloudfoundry.org
- plugins.cloudfoundry.org

Additionally, you will be allowed to access applications you deploy during the exam.

Any resource not in the list above is **prohibited**. This includes notes, other programs, this site and external devices (phones, watches, iPads, etc). If you open any other site (including a Google search), or if you open more than one additional browser tab, your exam will be terminated by the proctor. For this reason, we recommend you ensure you are comfortable searching docs.cloudfoundry.org.

The full CLI is installed, including all help functions, and is available for use throughout the exam.

{{% notice warning %}}
The allowed sites above may contain links that point to external sites. It is the responsibility of the candidate not to click on any links that cause them to navigate to a domain that is not allowed.
{{% /notice %}}
