variable "attributes" {
  type = list(object({
    name = string
    type = string
  }))
  description = "List of non-index attributes to declare in DynamoDB table."
  default     = []
}

variable "hash_key" {
  type        = string
  description = "Hash key for DynamoDB table."
}

variable "hash_key_type" {
  type        = string
  description = "Hash key type for DynamoDB table."
}

variable "project_name" {
  type        = string
  description = "Base name for the database project."
}

variable "range_key" {
  type        = string
  description = "Hash key for DynamoDB table."
  default     = ""
}

variable "range_key_type" {
  type        = string
  description = "Hash key type for DynamoDB table."
  default     = "S"
}

variable "read_capacity" {
  type        = number
  description = "Read Capacity for DynamoDB table."
  default     = 5
}

variable "stream" {
  type        = bool
  description = "Stream Enabled for DynamoDB table."
  default     = false
}

variable "stream_view" {
  type        = string
  description = "Stream View Type for DynamoDB table."
  default     = "NEW_IMAGE"
}

variable "table_name" {
  type        = string
  description = "Table name for DynamoDB."
}

variable "write_capacity" {
  type        = number
  description = "Write Capacity for DynamoDB table."
  default     = 5
}