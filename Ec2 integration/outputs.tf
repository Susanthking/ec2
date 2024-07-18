output "ses_domain_identity_arn" {
  value = module.ses.ses_domain_identity_arn
}

output "efs_id" {
  value = module.efs.efs_id
}

output "redis_endpoint" {
  value = module.redis.redis_endpoint
}

output "sftp_server_id" {
  value = module.sftp.sftp_server_id
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "ec2_public_ip" {
  value = aws_instance.app.public_ip
}
