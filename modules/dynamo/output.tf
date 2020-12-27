output "stream_arn" {
  value = aws_dynamodb_table.dynamo.stream_arn
}

output "table_arn" {
  value = aws_dynamodb_table.dynamo.arn
}