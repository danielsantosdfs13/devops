terraform init ./prepare/terraform
terraform plan -var-file="inputs/terraform.tfvars" ./prepare/terraform 
# terraform apply --auto-approve