provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "react_frontend" {
  bucket = var.bucket_name

}

resource "aws_s3_bucket_policy" "react_frontend_policy" {
  bucket = aws_s3_bucket.react_frontend.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.react_frontend.arn}/*"
      }
    ]
  })
}
