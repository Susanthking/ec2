resource "aws_transfer_server" "sftp" {
  endpoint_type = "PUBLIC"
}

resource "aws_transfer_user" "sftp_user" {
  server_id   = aws_transfer_server.sftp.id
  user_name   = var.user_name
  role        = aws_iam_role.sftp_role.arn
  home_directory = "/${var.user_name}"
}

resource "aws_iam_role" "sftp_role" {
  name = "SFTPAccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "transfer.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy_attachment" "sftp_policy_attach" {
  policy_arn = var.sftp_policy_arn
  roles      = [aws_iam_role.sftp_role.name]
}

output "sftp_server_id" {
  value = aws_transfer_server.sftp.id
}
