
resource "aws_s3_bucket" "state_bucket" {
  bucket = "statefile.bucket.lionel" # create variable and count or foreach
}

resource "aws_s3_bucket_acl" "state_bucket_acl" {
  bucket = aws_s3_bucket.state_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "state_bucket_versioning" {
  bucket = aws_s3_bucket.state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "terraform-state-lock"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }
}


