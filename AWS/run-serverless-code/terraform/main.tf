# Default provider
provider "aws" {
  region = "us-east-1"
}

# Provider for "dev_user"
provider "aws" {
  alias  = "dev_user"
  profile = "dev_user"  # Refers to the `dev_user` profile in your AWS credentials file
  region  = "us-east-1"
}

# Root module calling submodules for IAM and Lambda
module "iam" {
  source             = "./modules/iam"
  iam_group_name     = var.iam_group_name
  iam_policy_file    = var.iam_policy_file
  iam_user_name      = var.iam_user_name
}

resource "null_resource" "wait_for_iam_propagation" {
  triggers = {
    timestamp = timestamp()
  }

  provisioner "local-exec" {
    command = "sleep 10" 
  }

  depends_on = [
    module.iam
  ]
}

module "lambda" {
  source             = "./modules/lambda"
  lambda_function_name = var.lambda_function_name
  lambda_runtime       = var.lambda_runtime
  lambda_handler       = var.lambda_handler
  python_script_path   = var.python_script_path

  providers = {
    aws = aws.dev_user
  }

  depends_on = [
    null_resource.wait_for_iam_propagation
  ]
}

# Outputs
output "iam_group_name" {
  value = module.iam.iam_group_name
}

output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}