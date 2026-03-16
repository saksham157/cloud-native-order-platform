module "vpc" {
  source = "../../modules/vpc"

  environment        = var.environment
  cidr_block         = var.cidr_block
  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
}

module "security-groups" {
  source = "../../modules/security-groups"

  environment = var.environment
  vpc_id      = module.vpc.vpc_id
}

module "iam" {
  source = "../../modules/iam-role"

  environment = var.environment
}

module "eks" {

  source = "../../modules/eks-cluster"

  environment = var.environment

  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn

  subnet_ids = module.vpc.private_subnet_ids

  cluster_security_group_id = module.security-groups.cluster_security_group_id
}