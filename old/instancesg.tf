resource "aws_security_group" "InstanceSG"{
name = "I-SG"
vpc_id = aws_vpc.vpc1.id
ingress {
from_port = "22"
to_port = "22"
protocol ="tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress{
from_port = "80"
to_port = "80"
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
from_port = "80"
to_port = "80"
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
tags={
"Name" = "Instance-SG"
}
}