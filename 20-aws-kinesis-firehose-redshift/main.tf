resource "aws_redshift_cluster" "arviu_aws_firehose_cluster" {
  cluster_identifier = "arviu-aws-firehose-redshift-cluster"
  database_name      = "meta"
  master_username    = "meta"
  master_password    = "Meta1234"
  node_type          = "dc2.large"
  cluster_type       = "single-node"
}
resource "aws_s3_bucket" "arviu_aws_firehose_bucket" {
  bucket = "arviu-s3-bucket-kinesis"
  acl    = "private"
}
resource "aws_iam_role" "arviu_aws_firehose_role" {
  name = "arviu_aws_firehose_redshift_role"

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
resource "aws_kinesis_firehose_delivery_stream" "arviu_aws_firehose_stream" {
  name        = "arviu-aws-firehose-redshift-stream"
  destination = "redshift"

  s3_configuration {
    role_arn           = aws_iam_role.arviu_aws_firehose_role.arn
    bucket_arn         = aws_s3_bucket.arviu_aws_firehose_bucket.arn
    buffer_size        = 10
    buffer_interval    = 400
    compression_format = "GZIP"
  }

  redshift_configuration {
    role_arn           = aws_iam_role.arviu_aws_firehose_role.arn
    cluster_jdbcurl    = "jdbc:redshift://${aws_redshift_cluster.arviu_aws_firehose_cluster.endpoint}/${aws_redshift_cluster.arviu_aws_firehose_cluster.database_name}"
    username           = "Meta"
    password           = "Meta1234"
    data_table_name    = "test-table"
    copy_options       = "delimiter '|'" # the default delimiter
    data_table_columns = "test-col"
    s3_backup_mode     = "Enabled"

    s3_backup_configuration {
      role_arn           = aws_iam_role.arviu_aws_firehose_role.arn
      bucket_arn         = aws_s3_bucket.arviu_aws_firehose_bucket.arn
      buffer_size        = 15
      buffer_interval    = 300
      compression_format = "GZIP"
    }
  }
}