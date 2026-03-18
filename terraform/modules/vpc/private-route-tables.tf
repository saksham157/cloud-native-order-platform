resource "aws_route_table" "private"{
    vpc_id = aws_vpc.main.id

    route{
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway.id
    }
    tags = {
        Name = "${var.environment}-private-rt"
    }
}

resource "aws_route_table_association" "private"{
    count = length(var.private_subnets)
    subnet_id = aws_subnet.private[count.index].id
    route_table_id =  aws_route_table.private.id
}