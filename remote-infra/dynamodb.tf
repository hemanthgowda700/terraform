resource "aws_dynamodb_table" "remote-dynamodb-table" {
  name           = "hpg-dynamodb-for-tflock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  

  attribute {
    name = "LockID"
    type = "S"
  }


  tags = {
    Name        = "hpg-dynamodb-for-tflock"
    
  }
}