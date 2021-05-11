resource "aws_vpc" "prod-vpc" {
    cidr_block = "${var.vpc_CIDR}"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"

    tags {
        Name = "prod-vpc"
    }
}

resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    cidr_block = "${var.subnet_CIDR}"
    map_public_ip_on_launch = "${var.ispublic}" //it makes this a public subnet
    availability_zone = "eu-west-2a"

    tags {
        Name = "prod-subnet-public-1"
    }
}	