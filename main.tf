provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

# Try to fetch the bucket if it exists
data "aws_s3_bucket" "react_frontend" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket" "react_frontend" {
  bucket = var.bucket_name

  tags = {
    Environment = "Development"
    Project     = "Movie App Frontend"
  }

}


resource "aws_s3_bucket_policy" "react_frontend_policy" {
  bucket = aws_s3_bucket.react_frontend.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { "AWS" : data.aws_caller_identity.current.arn } # Replace with the actual IAM user ARN
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.react_frontend.arn}/*"
      }
    ]
  })
}



resource "aws_s3_bucket_website_configuration" "react_frontend_website" {
  bucket = aws_s3_bucket.react_frontend.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }

}

