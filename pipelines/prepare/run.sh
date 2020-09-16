terraform init ./prepare/terraform
# terraform plan -var-file="../inputs/terraform.tfvars" ./prepare/terraform 
terraform destroy -var-file="../inputs/terraform.tfvars" --auto-approve ./prepare/terraform