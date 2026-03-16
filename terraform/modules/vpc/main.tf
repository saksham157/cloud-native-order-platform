resource "aws_vpc" "main"{
    cidr_blocks = var.cidr_blocks
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        name = "${var.environment}-vpc"
        Environment = var.environment
    }
}