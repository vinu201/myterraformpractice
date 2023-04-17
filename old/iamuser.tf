resource "aws_iam_user" "i11"{
name = "vinu"
}

resource "aws_iam_policy" "p22"{
name        = "test_policy"
policy = file("./instancepolicy.json")
}

resource aws_iam_policy_attachment "i11p22"{
name = "ipolicy"
users = [aws_iam_user.i11.name]
policy_arn = aws_iam_policy.p22.arn


}

output "v1"{
value = aws_iam_policy.p22.arn
}