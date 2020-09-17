# Provider AWS

variable "eks_cluster_name" {
  type        = string
  description = "Nome do cluster eks"
}

variable "ec2_key_pair_eks_worker" {
  type        = string
  description = "Key pair a ser utilizada para acesso remoto ao worker do cluster eks"
}

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}
