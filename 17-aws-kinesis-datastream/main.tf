resource "aws_kinesis_stream" "arviu-aws-kinesis" {
  name             = "arviu-aws-kinesis"
  shard_count      = 1
  retention_period = 24

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]

  tags = {
    name = "arviu-aws-kinesis"
  }
}