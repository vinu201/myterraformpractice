resource "aws_elb" "testelb"{
name = "testelb"
subnets = [aws_subnet.sn1.id,aws_subnet.sn2.id,aws_subnet.sn3.id]
listener {
instance_port = "80"
instance_protocol = "HTTP"
lb_port = "80"
lb_protocol = "HTTP"
}
security_groups = [aws_security_group.ElbSG.id]
tags= {
"Name" = "Test-ELB"
}
}

output "v1"{
value= aws_elb.testelb.dns_name
}