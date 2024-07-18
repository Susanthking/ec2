resource "aws_ses_domain_identity" "domain" {
  domain = var.domain_name
}

resource "aws_ses_domain_dkim" "dkim" {
  domain = aws_ses_domain_identity.domain.domain
}

output "ses_domain_identity_arn" {
  value = aws_ses_domain_identity.domain.arn
}
