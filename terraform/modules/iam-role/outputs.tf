output "cluster_role_arn"{
    value = aws_iam_role.eks_cluster_role.arn
}

output "node_role_arn"{
    value = aws_iam_role.eks_node_role.arn
}

output "oidc_provider_url" {
  value = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.eks.arn
}