resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "${var.env}-${var.bucket_name}"

  tags = {
    Name        = "remote-s3-bucket-for-tflock"
    Environment = var.env
  }
}

