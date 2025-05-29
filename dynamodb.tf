resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "basic-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"  # change to "N" if needed
  }
  tags = {
    Name        = "${var.env}-infra-app-table"
    Environment = var.env
  }
}
