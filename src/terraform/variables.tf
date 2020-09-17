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

variable "remote_access_ssh_cidr" {
  default     = ["10.0.0.0/8"]
  type        = list(string)
  description = "Lista de endereços permitido para acesso remoto via ssh aos workers do cluster eks"
}

variable "vpc_name" {
  default     = "vpc-eks"
  type        = string
  description = "Nome da VPC a ser utilizada pelo cluster EKS"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  type        = string
  description = "Address space a ser utilizado na VPC"
}

variable "vpc_private_subnets" {
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  type        = list(string)
  description = "Definição das subnetes privadas para VPC"
}

variable "vpc_public_subnets" {
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  type        = list(string)
  description = "Definição das subnetes privadas para VPC"
}

variable "vpc_enable_nat_gateway" {
  default     = true
  type        = bool
  description = "Habilitar criação de um nat gateway para a VPC"
}

variable "vpc_single_nat_gateway" {
  default     = true
  type        = bool
  description = "Utilizar unico nat gateway para VPC"
}

variable "vpc_enable_dns_hostnames" {
  default     = true
  type        = bool
  description = "Ativar configuração de dns para VPC"
}
