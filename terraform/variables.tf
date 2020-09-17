# Provider AWS

variable "eks_cluster_name" {
  type        = string
  description = "Nome do cluster eks"
}

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}
