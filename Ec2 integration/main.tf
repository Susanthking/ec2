provider "aws" {
  region = us-west-2    
}

module "ses" {
  source      = "./modules/ses"
  domain_name = var.domain_name
}

module "efs" {
  source            = "./modules/efs"
  subnet_ids        = var.subnet_ids
  security_group_id = var.security_group_id
}

module "redis" {
  source            = "./modules/redis"
  name              = var.redis_name
  subnet_ids        = var.subnet_ids
  security_group_id = var.security_group_id
  node_type         = var.redis_node_type
}

module "sftp" {
  source            = "./modules/sftp"
  user_name         = var.sftp_user_name
  sftp_policy_arn   = var.sftp_policy_arn
}

module "lambda" {
  source           = "./modules/lambda"
  lambda_zip       = var.lambda_zip
  function_name    = var.lambda_function_name
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
  lambda_policy_arn = var.lambda_policy_arn
}

resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              yum install -y amazon-efs-utils
              mkdir /mnt/efs
              mount -t efs ${module.efs.efs_id}:/ /mnt/efs

              yum install -y python3
              pip3 install boto3 redis paramiko

              cat > /home/ec2-user/app.py <<EOL
              import boto3
              import redis
              import paramiko
              # Sample integration logic here
              EOL

              python3 /home/ec2-user/app.py
              EOF
}

output "ec2_public_ip" {
  value = aws_instance.app.public_ip
}
