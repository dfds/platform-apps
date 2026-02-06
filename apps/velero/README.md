# Velero requirements

1. S3 bucket
2. Azure credentials and resource group
3. Azure storage account

## S3 bucket

- Create an S3 bucket in your AWS account to use for storing Velero backups. Copy the ARN.
- Define `velero_bucket_arn` variable in your sandbox' `services/terragrunt.hcl` file.

## Azure credentials and resource group

- In our 1Password vault, find the entry called 'Azure - Offsite Backup'.
- Copy the contents of its `qa` section.
- Create a new section with the name of your sandbox.
- Paste the contents of the `qa` into your new sandbox section.

## Azure storage account

- Find the `AZURE_SUBSCRIPTION_ID` the contents of its `<your-sandbox>` section.
- Find the `AZURE_RESOURCE_GROUP` the contents of its `<your-sandbox>` section.
- Define `velero_azure_resource_group_name` variable in your sandbox' `services/terragrunt.hcl` file.
- Define `velero_azure_subscription_id` variable in your sandbox' `services/terragrunt.hcl` file.
- Login to <https://portal.azure.com/>
- Create a new storage account in the `AZURE_RESOURCE_GROUP`.
- It could be wise to use your id or cluster name as part of the name.
- Inside the storage account, create a new Blob called `velero-backup`.
- On the storage account's network settings, choose to allow network access from specific IP addresses.
- Add the IP addresses from your client and the public IP addreses of your Kubernetes sandbox cluster.
- Define `velero_azure_storage_account_name` variable in your sandbox' `services/terragrunt.hcl` file.
