# Output variable definitions

# output "website_bucket_arn" {
#   description = "ARN of the bucket"
#   value       = module.website_s3_bucket.arn
# }

# output "website_bucket_name" {
#   description = "Name (id) of the bucket"
#   value       = module.website_s3_bucket.name
# }

# output "website_bucket_domain" {
#   description = "Domain name of the bucket"
#   value       = module.website_s3_bucket.domain
# }

output "role-arn" {
  description = "Glue role name"
  value = module.iam_role_creation.role-arn
}

output "lambda-arn" {
  description = "Lambda role name"
  value = module.iam_role_creation.lambda-arn
}