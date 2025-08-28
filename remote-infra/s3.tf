resource "aws_s3_bucket" "remote_s3_bucket" {
  bucket = "hpg-s3-bucket-for-tflock"

  tags = {
    Name        = "remote-s3-bucket-for-tflock"

  }
}