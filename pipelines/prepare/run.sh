terraform init ./prepare/terraform
terraform plan -var-file="pipelines/inputs/terraform.tfvars" ./prepare/terraform 
# terraform apply --auto-approve