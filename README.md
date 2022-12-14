# Module 4

# Problem - Deploy a modern analytics platform - LENS
## Background
Fabrikam has decided to move forward with widescale deployment of their new cloud environment, but wants an easier way to manage and control deployments using infrastructure as code. While there has been progress completed in modernizing the components and improving the overall developer worklow, there are benefits of going to the cloud that will never be realized in its current state. The client has worked with Insight and trusts you as a developer to find the right way to implement this new requirement. The following is the outline of what Fabrikam wants in order to facilitate their IaC requirements.


### Technical Overview
- Repository Link
> https://github.com/lnformbu-insight/CodeToCloud-Student/blob/main/Challenges/Module4-Develop-IaC/Module4-LENS.md

- Review the IaC folder in the repository 
### Scope and Approach
- Deploy 3 environments of LENS into a subscriptions into 3 separate resource groups

### Deliverables
- Review of the LENS Resources in each resource group
- Walkthrough of terraform code repositories
- Walkthrough of platform deployment process
`
# SOLUTION


### Deplyoing infra with Terraform.
`
### Adding passwords securely.
> | https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables
|

`

# STEPS

## 1. Create 3 Resource groups   
> | https://chat.openai.com/chat |


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

## Note:
> 1. The azurerm_sql_database resource is deprecated in version 3.0 of the AzureRM provider and will be removed in version 4.0. Please use the azurerm_mssql_database resource instead.

`
## Providers:
#
| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) |~> 3.0.2 |
| <a name="provider_azured"></a> [azurerd](#provider\_azuread) | ~> 3.31.0 |
| <a name="provider_Hashicorp"></a> [Terraform](#provider\Hashicorp) | >= 0.15.0 |


## Reference :
#
| Name | Resaource |
|------|------|
| [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | 1 |
| [azurerm_mssql_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | a |
| [azurerm_storage_data_lake_gen2_filesystem](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_data_lake_gen2_filesystem) | b |
| [azurerm_key_vault.keyvault1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | c |
| [Data Factory](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory) | d |
| [Azure  Databricks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace) | e |
| [Service Analysis](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/analysis_services_server) | f |

