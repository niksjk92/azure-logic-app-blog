# azure-logic-app-blog
Blog branch for azure logic app creation. Take note that this branch only provides a demo of the possible changes


## Installation

Use the below commands to clone the repo

```bash
git clone git@github.com:niksjk92/azure-logic-app-blog.git
cd azure-logic-app-blog
```

## Resources created
1. Resource group
2. Storage account with 2 containers
3. API connections to share point and storage account created
4. Logic app using arm resource template
5. Function app using arm resource template
6. Application insights for the function app


## Pre-requisites
1. Azure portal subscription id
2. Create a Service principal with 'write' privileges to the afore mentioned subscription

## Pipeline secrets needed
1. ARM_SUBSCRIPTION_ID
2. ARM_CLIENT_ID
3. ARM_CLIENT_SECRET
4. ARM_TENANT_ID
5. AZURE_FA_NAME
6. AZURE_FUNCTIONAPP_PUBLISH_PROFILE
