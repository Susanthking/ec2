resource "aws_lambda_function" "lambda" {
  filename         = var.lambda_zip
  function_name    = var.function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = var.handler
  runtime          = var.runtime
  source_code_hash = filebase64sha256(var.lambda_zip)
}

resource "aws_iam_role" "lambda_role" {
  name = "LambdaExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy_attachment" "lambda_policy_attach" {
  policy_arn = var.lambda_policy_arn
  roles      = [aws_iam_role.lambda_role.name]
}

output "lambda_function_arn" {
  value = aws_lambda_function.lambda.arn
}
