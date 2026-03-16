variable "environment" {
    type = string
}

variable "cidr_block" {
    type = string
}

variable "availability_zones" {
    type = string
}

variable "public_subnets" {
    type = list(string)
}

variable "private_subnets" {
    type = list(string)
}

