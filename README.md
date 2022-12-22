# Module 4 step by step solution
lookup more information Here https://github.com/grhoads-Insight

https://github.com/lnformbu-insight/CodeToCloud-Student/blob/main/Challenges/Module4-Develop-IaC/Module4-LENS.md


# Problem - Deploy a modern analytics platform - LENS
## Background
Fabrikam has decided to move forward with widescale deployment of their new cloud environment, but wants an easier way to manage and control deployments using infrastructure as code. While there has been progress completed in modernizing the components and improving the overall developer worklow, there are benefits of going to the cloud that will never be realized in its current state. The client has worked with Insight and trusts you as a developer to find the right way to implement this new requirement. The following is the outline of what Fabrikam wants in order to facilitate their IaC requirements.

**LENS Technology Overview**

![LENS-Overview](icons\LENS-Overview.png)


**LENS Platform  Overview**

![Platform Overview](icons\Platform-Overview.png)


**Infrastructure as Code Model**

![TF Structure](icons\TF-Azure.png)


### Technical Overview
- Repository Link
- Review the IaC folder in the repository 
### Scope and Approach
- Deploy 3 environments of LENS into a subscriptions into 3 separate resource groups

### Deliverables
- Review of the LENS Resources in each resource group
- Walkthrough of terraform code repositories
- Walkthrough of platform deployment process


# SOLUTION


# Deplyoing infra with Terraform.
## Adding passwords securely.
> | https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables
|
#

#  start solution

## 1. Create 3 Resource groups   
> | https://stackoverflow.com/questions/64668753/using-terraform-how-to-create-multiple-resources-of-same-type-with-unique-and-u |


    a. NewCo-ETL-dev-rg
    b. NewCo-ETL-uat-rg
    c. NewCo-ETL-prod-rg
    

## 2. Each resource group should have one of the following resources.
    a. SQL Database
    b. Data Lake Storage Gen2
    c. Key Vault
    d. Data Factory
    c. Azure  Databricks
    e. Service Analysis

# Note:
> 1. The azurerm_sql_database resource is deprecated in version 3.0 of the AzureRM provider and will be removed in version 4.0. Please use the azurerm_mssql_database resource instead.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.2 |



## Reference

| Name | Resaource |
|------|------|
| [azurerm_sql_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/sql_database) | a |
| [azurerm_key_vault.keyvault1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | c |
| [azurerm_resource_group.environment_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

