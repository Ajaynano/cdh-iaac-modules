variable "project_name" {
    default = "CDH"
  
}

variable "project_env" {
  description = "Environment DEV | INT | UAT| PROD"
  default = "dev"
}

variable "glue_role_name" {
  description = "Glue job name"
}


variable "cdh_source_bucket_name" {
  type = string
  description = "s3 bukect name"
}

variable "region" {
  default = "eu-west-1"
}

variable "aws_account_number" {
  type = string
}

variable "kms-id" {
  type = string
}

variable "custom_policy_names" {
  type = set(string)
}