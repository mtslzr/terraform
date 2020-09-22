locals {
  attributes = concat(
  [
    {
      name = var.hash_key
      type = var.hash_key_type
    },
    {
      name = var.range_key
      type = var.range_key_type
    }
  ],
  var.attributes
  )
}

resource "aws_dynamodb_table" "dynamo" {
  name           = var.project_name
  hash_key       = var.hash_key
  range_key      = var.range_key
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  server_side_encryption {
    enabled = true
  }

  dynamic "attribute" {
    for_each = local.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  tags = {
    project = var.project_name
  }
}