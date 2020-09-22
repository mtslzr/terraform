data "aws_iam_policy_document" "trust" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "lambda_perms" {
  statement {
    effect    = "Allow"
    actions   = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_role" "lambda_role" {
  name               = var.project_name
  assume_role_policy = data.aws_iam_policy_document.trust.json

  tags = {
    project = var.project_name
  }
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "${var.project_name}-log"
  description = "Allow ${var.project_name} lambda to access CloudWatch."
  policy      = data.aws_iam_policy_document.lambda_perms.json
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_iam_role_policy_attachment" "custom_lambda_role_policy" {
  count      = var.policy_arn != "" ? 1 : 0
  role       = aws_iam_role.lambda_role.name
  policy_arn = var.policy_arn
}