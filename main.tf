resource "aws_s3_bucket" "example" {
  bucket = "hemu-bucket"
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.ecxample.id

  rule {
     id      = "dev"
     status = "Enabled"

    prefix = "dev/"
	
    expiration {
      date = "2022-03-07T00:00:00Z"
    }
  }
}
