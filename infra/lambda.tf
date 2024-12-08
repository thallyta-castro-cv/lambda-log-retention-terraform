data "archive_file" "lambda" {
  type        = "zip"
  source_file = "../app/lambda_function.py"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "log_export_lambda" {
  function_name = "log_export_lambda"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"

  filename      = data.archive_file.lambda.output_path

  role = aws_iam_role.lambda_execution_role.arn

  environment {
    variables = {
      GROUP_NAME        = "/aws/lambda/catalogEmitConsumer"
      DESTINATION_BUCKET = aws_s3_bucket.log_export_bucket.id
      PREFIX            = "log"
    }
  }
}
