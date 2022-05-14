resource "aws_kinesis_firehose_delivery_stream" "arviu_aws_firehose_extended_s3_stream" {
  name        = "arviu-aws-firehose-extended-s3-test-stream"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.arviu_aws_firehose_role.arn
    bucket_arn = aws_s3_bucket.arviu-aws-firehose-bucket.arn

    processing_configuration {
      enabled = "false"

      
}
}
}

resource "aws_s3_bucket" "arviu-aws-firehose-bucket" {
  bucket = "arviu-firehose-bucket-s3"
  acl    = "private"
}

resource "aws_iam_role" "arviu_aws_firehose_role" {
  name = "arviu_aws_firehose_s3_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}