# iam user group 생성
resource "aws_iam_group" "devops_group" {
  name = "devops"
}
# 만든 그룹에 만든 사용자 추가
resource "aws_iam_group_membership" "devops" {
  name = aws_iam_group.devops_group.name
  # iam_group_membership에 사용자 추가
  users = [
    aws_iam_user.gildong_hong.name
  ]
  # iam_user_group_membership 과 iam_group을 실질적으로 매핑시키는 코드
  group = aws_iam_group.devops_group.name
}

