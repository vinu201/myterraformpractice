/*
resource "aws_instance" "I1sn4"{
ami = "ami-062550af7b9fa7d05"
instance_type = "t2.micro"
subnet_id = aws_subnet.sn4.id
security_groups = [aws_security_group.InstanceSG.id]
availability_zone = "ap-southeast-1a"
user_data = file ("./fileapache2.sh")

root_block_device {
volume_size = "8"
volume_type = "gp2"
}



tags= {
"Name" = "i1-sn4-vpc1"
}

}

*/