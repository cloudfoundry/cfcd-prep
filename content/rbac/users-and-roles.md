+++
title = "Users and Roles"
weight = "2"
+++

Cloud Foundry uses Role-Based Access Control (RBAC) to grant access to resources. Users can be assigned to roles globally (deployment-wide) or in particular orgs and spaces.

## Global Roles

Users can be assigned to the following global roles. Capabilities for these roles span an entire Cloud Foundry deployment (foundation). As a developer user of Cloud Foundry, it is unlikely you will ever be granted one of these roles. 

* **Admin**: The admin role allows a user to perform operational actions on all orgs and spaces.
* **Admin Read-Only**: The admin read-only role allows visibility into all orgs and spaces without modification.
* **Global Auditor**: The global auditor role is similar to the `Admin Read-Only` role above except this role cannot see secrets, such as environment variable content 

## Org Roles

Org roles grant user access at the org level. 

* **OrgManager**: Org managers can administer the org (they can create/modify/delete spaces, org-level roles, domains, etc in that org). 
* **OrgAuditor**: Org auditors have read-only access to the org.
* **BillingManager**: Billing managers can create and manage billing account and payment information associated with the org in Cloud Foundry instances that have deployed the billing engine.

Org roles do not cascade into spaces. For example, an `OrgManager` *cannot* deploy apps to spaces in the org. However, they can grant the `SpaceDeveloper` role to a user (including themselves) for a particular space.

## Space Roles

Space roles grant user access at the space level.

* **SpaceManager**: Space managers can administer roles for a space.
* **SpaceDeveloper**: Space developers can manage apps, services and routes in a space. A user must have the `SpaceDeveloper` role to push apps.
* **SpaceAuditor**: Space auditors have read-only access to a space.
