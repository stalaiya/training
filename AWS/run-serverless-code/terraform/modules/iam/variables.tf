variable "iam_group_name" {
  description = "Name of the IAM group to create"
  type        = string
}

variable "iam_policy_file" {
  description = "Path to the custom IAM policy file"
  type        = string
}

variable "iam_user_name" {
  description = "Name of the existing IAM user"
  type        = string
}