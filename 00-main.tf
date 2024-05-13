terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"

}

# module "website_s3_bucket" {
#   source = "./modules/aws-s3-static-website-bucket"

#   bucket_name = "${var.bucket_name}"

#   tags = {
#     Terraform   = "true"
#     Environment = "${var.project_env}"
#   }
# }

module "iam_role_creation" {
  source = "./modules/iam-role"
  glue_role_name = "${var.glue_role_name}"
  cdh_source_bucket_name ="${var.cdh_source_bucket_name}"
  aws_account_number = "${var.aws_account_number}"
  kms-id = "${var.kms-id}"
  custom_policy_names = var.custom_policy_names
}