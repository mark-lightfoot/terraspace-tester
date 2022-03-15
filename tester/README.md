# Terraspace Project

This is a Terraspace project. It contains code to provision Cloud infrastructure
built with [Terraform](https://www.terraform.io/) and the [Terraspace Framework](https://terraspace.cloud/).

## Service Accounts

Users should only be granted minimum access than broad reaching.

Users running terraspace locally require no more than:

-   ServiceAccountTokenCreator on the project factory SA
-   GCS Storage Admin on the tfstate bucket
-   Viewer

This allows for impersonation of the PF SA. This SA deploys folders, projects
and env-SA's. For "lower" resources, the env-SA is automatically assumed
for usage and ensuring blast radius/separation in gcp iam itself.

## Deploy

To deploy all the infrastructure stacks:

    terraspace all up

To deploy individual stacks:

    terraspace up project # where project is app/stacks/project

## Terrafile

To use more modules, add them to the [Terrafile](https://terraspace.cloud/docs/terrafile/).

## TODOS

-   Make the impersonation go via pf sa so we can bind easier
-   dynamicness
-   docs/tutorial
