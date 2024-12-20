# Create IAM group
resource "aws_iam_group" "dev_group" {
  name = var.iam_group_name
}

# Create a standalone managed policy
resource "aws_iam_policy" "dev_group_policy" {
  name  = "${var.iam_group_name}_policy"
  description = "policy attached to ${var.iam_user_name}"
  policy      = file(var.iam_policy_file)
}

# Attach the managed policy to the group
resource "aws_iam_policy_attachment" "dev_group_policy_attachment" {
  name       = "${var.iam_group_name}_policy_attachment"
  groups     = [aws_iam_group.dev_group.name]
  policy_arn = aws_iam_policy.dev_group_policy.arn
}

# Assign user to the group
resource "aws_iam_group_membership" "group_membership" {
  name = "${var.iam_group_name}_membership"
  users = [var.iam_user_name]
  group = aws_iam_group.dev_group.name
}