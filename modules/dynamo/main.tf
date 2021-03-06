locals {
  hash_attrs = concat(
    [
      {
        name = var.hash_key
        type = var.hash_key_type
      }
    ],
    var.attributes
  )

  attributes = var.range_key == "" ? local.hash_attrs : concat(
    local.hash_attrs,
    [
      {
        name = var.range_key
        type = var.range_key_type
      }
    ]
  )
}

resource "aws_dynamodb_table" "dynamo" {
  name           = "${var.project_name}-${var.table_name}"
  hash_key       = var.hash_key
  range_key      = var.range_key
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  stream_enabled   = var.stream
  stream_view_type = var.stream_view

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