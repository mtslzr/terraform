resource "aws_lambda_function" "lambda" {
  description   = var.description
  filename      = var.filename
  function_name = var.project_name
  handler       = var.handler
  role          = aws_iam_role.lambda_role.arn
  runtime       = var.runtime

  tags = {
    project = var.project_name
  }
}