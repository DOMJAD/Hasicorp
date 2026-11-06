variable "aws_region" {
  description = "AWS region where resources are created"
  type        = string
  default     = "us-east-1"
}

variable "bucket_prefix" {
  description = "Prefix used to build a globally-unique bucket name"
  type        = string
  default     = "tfc-demo"
}

variable "environment" {
  description = "Environment tag applied to resources"
  type        = string
  default     = "sandbox"
}
