output "cluster_role_arn"{
    value = aws_iam_role.eks_cluster_role
}

output "node_role_arn"{
    value = aws_iam_role.node_role_arn
}