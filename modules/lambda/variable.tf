variable "build_dir" {
  type        = string
  description = "Location of build folder for archive."
}

variable "description" {
  type        = string
  description = "Description of Lambda function."
}

variable "filename" {
  type        = string
  description = "Location of zip file to upload to Lambda."
}

variable "handler" {
  type        = string
  description = "Package and function for Lambda handler."
}

variable "policy_arn" {
  type        = string
  description = "Policy ARN of permissions for Lambda."
  default     = ""
}

variable "project_name" {
  type        = string
  description = "Base name for the Lambda's project."
}

variable "runtime" {
  type        = string
  description = "Selected runtime for Lambda."
}