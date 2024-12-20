# Input variables for root module
variable "iam_group_name" {
  description = "Name of the IAM group"
  type        = string
}

variable "iam_policy_file" {
  description = "Path to the custom IAM policy file"
  type        = string
}

variable "iam_user_name" {
  description = "Existing IAM user to associate with the group"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "python3.9"
}

variable "lambda_handler" {
  description = "Handler for the Lambda function"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "python_script_path" {
  description = "Path to the Python script for the Lambda function"
  type        = string
}
