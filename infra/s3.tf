resource "aws_s3_bucket" "log_export_bucket" {
  bucket = "s3-log-export-bucket"

  tags = {
    Name        = "log-export-bucket"
    Environment = "production"
  }
}

resource "aws_s3_bucket_policy" "logs_bucket_policy" {

  bucket = aws_s3_bucket.log_export_bucket.id

  policy = jsonencode({  
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "uploadcloudwatchlogs",
        Effect    = "Allow",
        Principal = { Service = "logs.${var.region}.amazonaws.com" },
        Action    = "s3:GetBucketAcl",
        Resource  = aws_s3_bucket.log_export_bucket.arn
      },
      {
        Sid       = "uploadcloudwatchlogs",
        Effect    = "Allow",
        Principal = { Service = "logs.${var.region}.amazonaws.com" },
        Action    = "s3:PutObject",
        Resource  = "${aws_s3_bucket.log_export_bucket.arn}/*"
      }
    ]
  })
}
