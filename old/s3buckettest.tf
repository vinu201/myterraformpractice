/*
resource "aws_s3_bucket" "ex1"{
//bucket_prefix = "hsbc-"
bucket = "hsbcvinod202"

}
*/

resource "aws_s3_bucket" "ex2"{
//bucket_prefix = "hsbc-"
bucket = "hsbcvinod2045"

}

resource "aws_s3_bucket_policy" "p1"{
bucket = aws_s3_bucket.ex2.id
policy = file("./specificipbucketpolicy.json")
}

resource "aws_s3_bucket_versioning" "v1"{
bucket = aws_s3_bucket.ex2.id
versioning_configuration {
status = "Enabled"
}
}