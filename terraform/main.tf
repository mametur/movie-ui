provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "state_bucket" {
  bucket = var.s3_tf_state_bucket_name

  tags = {
    Name = "Movie Frontend State Bucket"
  }

}



resource "aws_s3_bucket" "react_frontend" {
  bucket = var.s3_bucket_name

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

