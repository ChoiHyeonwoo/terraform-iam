# iam user 생성
resource "aws_iam_user" "gildong_hong" {
  name = "gildong.hong"
}
# iam user policy 생성
resource "aws_iam_user_policy" "art_devops_black" {
  name  = "super-admin"
  # 실질적 policy와 user를 매핑
  user  = aws_iam_user.gildong_hong.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}
