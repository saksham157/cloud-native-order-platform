resource "aws_eks_cluster" "eks_cluster" {

  name     = "${var.environment}-eks-cluster"
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = [var.cluster_security_group_id]
  }

}
resource "aws_eks_node_group" "node_group" {

  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.environment}-node-group"
  node_role_arn   = var.node_role_arn

  subnet_ids = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.large"]

  depends_on = [
    aws_eks_cluster.eks_cluster
  ]

}