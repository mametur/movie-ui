provider "aws" {
  region = "eu-west-3"
}

resource "aws_s3_bucket" "react_frontend" {
  bucket = "movie_react_app_mame_azad"

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
