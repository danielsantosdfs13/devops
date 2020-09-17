
resource "aws_security_group" "worker_group_mgmt_apps" {
  name_prefix = "${var.eks_cluster_name}-apps"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = var.remote_access_ssh_cidr
  }
}
