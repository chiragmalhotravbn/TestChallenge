# 3-Tier Azure Environment

This Terraform script sets up a multi-tier environment in Azure, comprising various components to manage data processing and automation efficiently.

## Architecture

### Source System and Azure Site-to-Site

- A source system is connected to Azure via an Azure Site-to-Site VPN.
- The Site-to-Site VPN connection is manually configured to establish a secure connection between your on-premises network and Azure.

### Virtual Network Configuration

- A Virtual Network (VNet) is created in Azure.
- VNet peering is configured to enable secure communication between VNets.

### Azure Data Factory (ADF)

- Azure Data Factory (ADF) is used for orchestration, data transformation (from raw to refined and curated), and data pipeline management.

### Azure Data Lake Storage (ADLS)

- Azure Data Lake Storage (ADLS) acts as a landing zone for incoming data.
- ADF processes data stored in ADLS.

### Azure Key Vault

- Azure Key Vault is used for securely storing and managing credentials, secrets, and keys for various services in your environment.

### Logic App for Email Notification

- Logic App is set up to trigger email notifications based on specific events or conditions within your environment.

### Azure Automation Account

- Azure Automation Account is configured to run PowerShell scripts for tasks such as starting and stopping servers during off-hours.

### Power BI and SQL Server

- Power BI connects to a SQL Server to access and visualize the final data residing in your environment.

## Usage

1. Deploy the Terraform script to set up the described multi-tier environment in your Azure subscription.

2. Customize the script by providing your specific configuration details, such as VNet settings, ADF pipelines, Key Vault secrets, and Logic App triggers.

3. Execute the Terraform script to provision and configure the resources in Azure.

## Prerequisites

- An Azure subscription.
- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.

For detailed guidance on using Terraform to deploy this environment, please refer to the provided Terraform script and documentation.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
