##########################
# Network infrastructure #
##########################

resource "aws_vpc" "main" {
    cidr_block = "10.1.0.0/16"
    enable_dnc_hostnames = true
    enable_dnc_support = true
}

#########################################################
# Internet Getaway needed for inbound access to the ALB #
#########################################################

resource "aws_internet_getaway" "main" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "${local.prefix}-main"
    }
}