#iam_role을 생성(EC2에 대한 role)
resource "aws_iam_role" "hello" {
  name               = "hello-iam-role"
  path               = "/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
# S3 ROLE policy를 생성 후 기존에 만들었던 role에 policy를 추가
resource "aws_iam_role_policy" "hello_s3" {
  name   = "hello-s3-download"
  # 실질적으로 ROLE에 Policy를 추가하는 코드 한줄.
  role   = aws_iam_role.hello.id
  policy = <<EOF
{
  "Statement": [
    {
      "Sid": "AllowAppArtifactsReadAccess",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "*"
      ],
      "Effect": "Allow"
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "hello" {
  name = "hello-profile"
  role = aws_iam_role.hello.name
}

