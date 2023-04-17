/*

resource aws_instance "i1"{
ami = "ami-062550af7b9fa7d05"
instance_type = "t2.micro"
availability_zone ="ap-southeast-1a"
subnet_id = "subnet-037ca4037a6d39431"
} 

output "v1"{
value = aws_instance.i1.subnet_id
//value1 = aws_instance.availability_zone
}
output "v2"{
//value = aws_instance.i1.subnet_id
value = aws_instance.i1.availability_zone
}


resource aws_ebs_volume "ebv1"{
availability_zone = aws_instance.i1.availability_zone
size = 10
}

resource "aws_volume_attachment" "vi"{
volume_id = aws_ebs_volume.ebv1.id
instance_id = aws_instance.i1.id
device_name = "/dev/sdh"
}
*/


