resource "aws_security_group" "eks_cluster_sg" {
    name = "${var.environment}-eks-cluster-sg"
    description = "security group for eks control plane"
    vpc_id = var.vpc_id

    ingress{
        description = "Allow https connection"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]

    }
    egress{
        description = "Allow all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_block = ["0.0.0.0/0"]

    }
    tags = {
        Name = "{var.environment}-eks-sg"

    }
}

resource "aws_security_group" "node_sg"{
    name = "${var.environment}-node-sg"
    description = "Security group for worker node"
    vpc_id = var.vpc_id

    ingress{
        description = "Allow node communication"
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        self = true
    }
    egress{
        description = "Allow outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_block = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.environment}-node-sg"
    }
}

