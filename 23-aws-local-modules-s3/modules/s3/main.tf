resource "aws_s3_bucket" "arivu_aws_bucket" {
  bucket = "${var.bucketname}" //globally shld be unique
  acl    = "private"

  tags = {
    Name        = "arivu_aws_bucket"
  }

  versioning {
    enabled = "${var.vers}" //boolean
  }
}
