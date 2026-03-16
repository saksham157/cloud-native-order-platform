module "vpc" {
    source = "../../modules/vpc"
    environment = var.environment
    cidr_block = var.cidr_block
    availability_zones = var.availability_zones
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
}