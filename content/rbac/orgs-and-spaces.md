+++
title = "Orgs and Spaces"
weight = "1"
+++


Orgs and spaces are logical separations within a Cloud Foundry instance. By default, there is no underlying physical separation in the underlying infrastructure. 

> Note: Isolation segments can be used to provide physical separation in the underlying infrastructure. However, isolation segments are out of scope for the exam.

While the use of orgs and spaces is required, their specific application is intended to reflect the needs of the people using the platform. Orgs and spaces are commonly used to represent different business units, projects, tenants, or environments.

## Scope

Applications, service instances, and routes are scoped to a space, and lifecycle operations for managing them must happen within that space. Access to a service instance can be extended between spaces using `cf share-service`, but lifecycle operations are only available in the space where the instance was created.

Every space exists within an org. An org only provides logical grouping of spaces, along with a convenient place to grant roles for managing access across them.

By using `cf target`, you can set the org and space that subsequent commands should affect. 

## Exam Structure

On the exam, you will have access to a single org. Each performance-based item has one or more spaces. It is your responsibility to manage the orgs and space you are targeting as you complete the tasks.

{{% notice tip %}}
Don't forget to target the correct space before starting a performance-based item. 
{{% /notice %}}
