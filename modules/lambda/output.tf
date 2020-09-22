output "lambda_arn" {
  value = aws_lambda_function.lambda.arn
}

output "lambda_role" {
  value = aws_iam_role.lambda_role.arn
}