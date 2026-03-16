variable "cidr_block"{
    description = "CIDR Block for VPC"
    type = string
}

variable "environment"{
    description = "Environment name {dev , stage, prod}"
    type = string
}

variable "availability_zones"{
    description = "availability zones for subnet"
    type = string
}

variable "public_subnets"{
    description = "public subnet for environment"
    type = list(string)
}

variable "private_subnets"{
    description = "private subnet for environment"
    type = list(string)
}

