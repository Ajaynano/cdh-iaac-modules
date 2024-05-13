output "role-arn" {
  description = "Glue role name"
  value = aws_iam_role.Glue_role.name
}

output "lambda-arn" {
  description = "Lambda role name"
  value = aws_iam_role.lambda_role.name
}