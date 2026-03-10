resource "aws_eip" "nat-gateway"{
    domain = "vpc"
    tags = {
        Name = "${var.environment}-nat-eip"
    }
}

resource "aws_nat_gateway" "nat-gateway"{
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.public[0].id

    tags = {
        Name = "${vaar.environment}-nat-gateway"
    }
}