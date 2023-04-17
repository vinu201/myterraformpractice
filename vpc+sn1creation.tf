resource "aws_vpc" "vpc1"{
cidr_block = "10.0.0.0/16"
tags={
Name= "vpc1"
 }
}

resource "aws_subnet" "sn1"{
vpc_id = aws_vpc.vpc1.id
cidr_block = "10.0.0.0/24"
availability_zone = "ap-southeast-1a"
tags={
Name= "Sn1-vpc1"
}
}
resource "aws_subnet" "sn2"{
vpc_id = aws_vpc.vpc1.id
cidr_block = "10.0.1.0/24"
availability_zone = "ap-southeast-1b"
tags={
Name= "Sn2-vpc1"
}
}

resource "aws_subnet" "sn3"{
cidr_block = "10.0.2.0/24"
vpc_id=aws_vpc.vpc1.id
availability_zone = "ap-southeast-1c"
tags={
"Name" = "sn3-vpc1"
}
}

resource "aws_subnet" "sn4"{
cidr_block= "10.0.3.0/24"
vpc_id = aws_vpc.vpc1.id
availability_zone= "ap-southeast-1a"
tags={
"Name" = "sn4-vpc1"
}
}

resource "aws_subnet" "sn5"{
cidr_block= "10.0.4.0/24"
vpc_id = aws_vpc.vpc1.id
availability_zone= "ap-southeast-1b"
tags={
"Name" = "sn5-vpc1"
}
}

resource "aws_subnet" "sn6"{
cidr_block= "10.0.5.0/24"
vpc_id = aws_vpc.vpc1.id
availability_zone= "ap-southeast-1c"
tags={
"Name" = "sn6-vpc1"
}
}

// creating internet gateway
resource "aws_internet_gateway" "igw"{
vpc_id = aws_vpc.vpc1.id
tags ={
"Name" = "igw-vpc1"
}
}

// creating route table and attach igw

resource "aws_route_table" "PublicRT"{
vpc_id = aws_vpc.vpc1.id
route {
gateway_id = aws_internet_gateway.igw.id
cidr_block = "0.0.0.0/0"
}
tags= {
"Name" = "PubliRT-vpc1"
}
}

// creating private rt attach nat
resource "aws_route_table" "privatert"{
vpc_id = aws_vpc.vpc1.id
route {
cidr_block= "0.0.0.0/0"
nat_gateway_id = aws_nat_gateway.nat1.id
}
tags={
"Name" ="PrivateRT-vpc1" 
}
}

//eip
resource "aws_eip" "eip1"{}

// create nat
resource "aws_nat_gateway" "nat1"{
subnet_id = aws_subnet.sn1.id
allocation_id = aws_eip.eip1.id
tags={
"Name"= "NAT-vpc1"
}
}

resource "aws_route_table_association" "rt1"{
route_table_id = aws_route_table.PublicRT.id
subnet_id = aws_subnet.sn1.id
}

resource "aws_route_table_association" "rt2"{
route_table_id = aws_route_table.PublicRT.id
subnet_id = aws_subnet.sn2.id
}

resource "aws_route_table_association" "rt3"{
route_table_id = aws_route_table.PublicRT.id
subnet_id = aws_subnet.sn3.id
}

resource "aws_route_table_association" "privatert1"{
route_table_id = aws_route_table.privatert.id
subnet_id = aws_subnet.sn4.id
}

resource "aws_route_table_association" "privatert2"{
route_table_id = aws_route_table.privatert.id
subnet_id = aws_subnet.sn5.id
}

resource "aws_route_table_association" "privatert3"{
route_table_id = aws_route_table.privatert.id
subnet_id = aws_subnet.sn6.id
}







