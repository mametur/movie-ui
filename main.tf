provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "react_frontend" {
  bucket = "movie-react-app-mame-azad"

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
        Principal = "*"
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

output "s3_website_url" {
  value = "http://${aws_s3_bucket.react_frontend.bucket}.s3-website.${var.region}.amazonaws.com"
}
