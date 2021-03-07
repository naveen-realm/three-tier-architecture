# three-tier-architecture


## Overview

The project contains terraform script which is used to build 3 tier architecture.


## Prerequisites

First and foremost, we'll need to have [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started) and the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) installed, as well as an active AWS account. Please refer to the official documentation to do so. Installing Terraform on Linux and macOS is easier, but if you're on Windows, I'd recommend installing Terraform using [Chocolatey](https://chocolatey.org/packages/terraform) (because it is easier).

Note: The aws access key and aws secret access key that you are using while 'aws configure' needs to have necessary permission to create/modify/delete the resources that are being done using terraform. 


## Usage

1. Clone the repo
   ```sh
   git clone https://github.com/naveen-realm/three-tier-architecture.git
   ```
2. Move into the folder using the below command
   ```sh
   cd three-tier-architecture/
   ```
3. Initialize terraform using the below command
   ```sh
   terraform init
   ```
4. Validate whether the terraform configuration files in the directory using the below command
   ```sh
   terraform validate
   ```
5. Check the current state of resources using the below command
   ```sh
   terraform show -no-color > initialstatetxt
   ```
6. Check the actions being performed by the terraform files using below command
   ```sh
   terraform plan -out "planfile"
   terraform show -no-color planfile > planfiletxt
   ```
7. To create or modify the resources using terraform use below command
   ```sh
   terraform apply -input=false "planfile"
   terraform show -no-color > finalstatetxt
   ```
8. If you need to destroy the resources using the terraform script, follow the below instructions
   i. To check the resources being deleted use the below command:
      ```sh
      terraform plan -destroy -out "planfile"
      ```
   ii. To destroy the resources use the below command:
      ```sh
      terraform destroy -auto-approve
      ```


## License

Distributed under the MIT License. See `LICENSE` for more information.
