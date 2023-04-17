resource "aws_instance" "i1"{
ami = "ami-062550af7b9fa7d05"
instance_type = "t2.micro"
subnet_id = "subnet-0873926b7baee65a8"

tags = {
"Name" = "i1"
}

}

resource aws_eip "e"{
depends_on = [aws_instance.i1]
}

resource "aws_eip_association" "ei"{
instance_id = aws_instance.i1.id
allocation_id = aws_eip.e.id
}