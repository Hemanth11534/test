resource "aws_s3_bucket" "hemudev" {
  bucket = "hemu-dev"
}

resource "aws_s3_bucket_object" "archive" {
  bucket = aws_s3_bucket.hemudev.id
  key    = "dev/"
  content                = "application/x-directory"
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  bucket = aws_s3_bucket.hemudev.id

  rule {
    id      = "dev"
     status = "Enabled"

    prefix = "dev/"
	
    expiration {
      date = "2022-03-07T00:00:00Z"
    }
  }
}
