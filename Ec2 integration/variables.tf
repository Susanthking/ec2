variable "region" {
  description = "AWS region"
  type        = string
}

variable "domain_name" {
  description = "Domain name for SES"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for EFS and Redis"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "redis_name" {
  description = "Redis cluster name"
  type        = string
}

variable "redis_node_type" {
  description = "Redis node type"
  type        = string
}

variable "sftp_user_name" {
  description = "SFTP user name"
  type        = string
}

variable "sftp_policy_arn" {
  description = "IAM policy ARN for SFTP"
  type        = string
}

variable "lambda_zip" {
  description = "Path to Lambda zip file"
  type        = string
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
}

variable "lambda_handler" {
  description = "Lambda handler"
  type        = string
}

variable "lambda_runtime" {
  description = "Lambda runtime"
  type        = string
}

variable "lambda_policy_arn" {
  description = "IAM policy ARN for Lambda"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instance"
  type        = string
}
