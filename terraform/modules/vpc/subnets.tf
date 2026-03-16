resource "aws_subnet" "public"{
    count = length(var.public_subnets)

    vpc_id = aws_vpc.main.id
    cidr_blocks = var.public_subnets[count.index]
    availability_zone = var.availability_zones[count.index]
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.environment}-public-${count.index}"
        Environment = var.environment

    }

}

resource "aws_subnet" "private"{
    count  =length(var.private_subnets)

    vpc_id = aws_vpc.main.id
    cidr_blocks = var.private_subnets[count.index]
    availability_zone = var.availability_zones[count.index]

    tags = {
        Name = "${var.environment}-private-${count.index}"
    }

}