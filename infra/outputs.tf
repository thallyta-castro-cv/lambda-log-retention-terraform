output "s3_bucket_arn" {
  description = "ARN do Bucket S3"
  value       = aws_s3_bucket.log_export_bucket.arn
}

output "lambda_function_name" {
  description = "Nome da Função Lambda"
  value       = aws_lambda_function.log_export_lambda.function_name
}
