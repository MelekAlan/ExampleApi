# Terraform AWS EKS Infrastructure

## Local usage for developing

### 1) Setup AWS API Credentials for the AWS Terraform provider

- (Only do once) Copy the `setupHelpers/emptyAwsApiSetup.sh` file to `setupHelpers/awsApiSetup.sh`
- (Only do once) Fill the `setupHelpers/awsApiSetup.sh` file with the AWS API Credentials
- Run `source setupHelpers/awsApiSetup.sh` from the root dir of this project.

### 2) Initial setup

- (Only do once or after adding a new module in the modules folder)
  - Run `terraform init` inside the `src` folder


# Execution

## Production

* `terraform plan -var-file="variables.tfvars"`
* `terraform apply -var-file="variables.tfvars"`

## Dev

* `terraform plan -var-file="variablesDev.tfvars"`
* `terraform apply -var-file="variablesDev.tfvars"`
