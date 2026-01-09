resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "${var.env}-bucket"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" { ## optional configuration
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = var.versioning_status
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt" {   ## optional configuration
    bucket = aws_s3_bucket.my_bucket.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  
}