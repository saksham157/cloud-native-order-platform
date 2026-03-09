resource "aws_subnet" "public"{
    count = length(var.public_subnets)

    vpc_id = vpc_id.main.id
    cidr_block = var.public_subnets[count.index]
    availability_zones = var.availability_zones[count.index]
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.environment}-public-${count.index}"
        Environment = var.environment

    }

}

resource "aws_subnet" "private"{
    count  =length(var.private_subnets)

    vpc_id = vpc_id.main.id
    cidr_block = var.private_subnet[count.index]
    availability_zones = var.availability_zones[count.index]

    tags = {
        Name = "${var.environment}-private-${count.index}"
    }

}