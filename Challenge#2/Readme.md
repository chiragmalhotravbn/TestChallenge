# Azure Virtual Machine Metadata Retrieval Script

This repository contains a PowerShell script designed to fetch metadata for your Azure Virtual Machines (VMs). The script is built to perform the following key functions:

- **Azure Authentication**: It facilitates a secure connection to your Azure account, ensuring access to your Azure resources.

- **VM List Retrieval**: The script retrieves a comprehensive list of all your Azure Virtual Machines, storing them in a variable for further processing.

- **Metadata Retrieval**: Utilizing a loop, it extracts critical information about each VM. This includes details such as VM name, resource group, location, VM size, computer name, admin username, public IP (if available), and private IP.

- **Error Handling**: The script has built-in error handling to gracefully manage any unforeseen issues that may occur during execution.

## Usage

To use this script, follow these straightforward steps:

1. **Prerequisites**: Ensure you have the Azure PowerShell module installed on your machine.

2. **Script Execution**:
   - Open the script and provide your Azure credentials to establish a connection.
   - Execute the script to retrieve essential VM metadata.

## Prerequisites

- [Azure PowerShell module](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps)

Feel free to customize and enhance this readme to include any additional instructions or pertinent information. This script simplifies the process of retrieving Azure VM metadata, making it more efficient and accessible for your tasks.
