resource "aws_dynamodb_table" "my-dynamodb-table" {
  name           = "${var.env}-infra-app-dynamodb"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key
  

  attribute {
    name = var.hash_key
    type = "S"
  }


  tags = {
    Name        = "${var.env}-infra-app-dynamodb"
    Environment = var.env
  }
}