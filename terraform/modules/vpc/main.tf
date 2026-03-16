resource "aws_vpc" "main"{
    cidr_block = var.cidr_block
    enable_dns_support = true
    enable_dns_hostname = true

    tags = {
        name = "${var.environment}-vpc"
        Environment = var.environment
    }
}