resource "aws_eks_node_group" "eks_cluster_worker_apps" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "apps"
  node_role_arn   = aws_iam_role.eks_cluster_worker_apps_role.arn
  subnet_ids      = module.vpc.private_subnets
  labels          = {
    "group" = "apps"
  }
  instance_types = ["t3.medium"]
  
  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  remote_access {
    ec2_ssh_key               = var.ec2_key_pair_eks_worker
    source_security_group_ids = [aws_security_group.worker_group_mgmt_apps.id]
  }  

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_eks_cluster.eks_cluster
  ]
}