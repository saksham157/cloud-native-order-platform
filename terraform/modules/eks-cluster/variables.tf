variable "environment" {
    description = "Environment name"
    type = string
}

variable "cluster_role_arn" {
    description = "Iam Role Arn for cluster"
    type = string
}
variable "node_role_arn" {
  description = "IAM role ARN for worker nodes"
  type        = string
}

variable "subnet_ids" {
    description = "private subnet ids for EKS"
    type = list(string)
}

variable "cluster_security_group_id"{
    description = "security group for EKS"
    type = string
}