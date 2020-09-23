data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = var.filename
  source_dir  = var.build_dir
}

resource "aws_lambda_function" "lambda" {
  description      = var.description
  filename         = var.filename
  function_name    = var.project_name
  handler          = var.handler
  role             = aws_iam_role.lambda_role.arn
  runtime          = var.runtime
  source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)

  tags = {
    project = var.project_name
  }
}