provider "aws" {
  region = "us-east-1"  # Set your desired AWS region
}

resource "aws_s3_bucket" "website" {
  bucket = "your-unique-bucket-name"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.website.bucket
  key    = "index.html"
  acl    = "public-read"

  source = "path/to/your/index.html"  # Replace with the actual path to your HTML file
}

resource "aws_s3_bucket_object" "error" {
  bucket = aws_s3_bucket.website.bucket
  key    = "error.html"
  acl    = "public-read"

  source = "path/to/your/error.html"  # Replace with the actual path to your HTML file
}
