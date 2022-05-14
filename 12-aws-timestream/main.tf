resource "aws_timestreamwrite_database" "arviu-aws-timestreamdb" {
  database_name = "arviu-aws-timestreamdb"
}
resource "aws_timestreamwrite_table" "arviu-aws-timestreamdb-table" {
  database_name = aws_timestreamwrite_database.arviu-aws-timestreamdb.database_name
  table_name    = "arviu-aws-timestreamdb-example"

  retention_properties {
    magnetic_store_retention_period_in_days = 30
    memory_store_retention_period_in_hours  = 8
  }

  tags = {
    Name = "arviu-aws-timestreamdb-example"
  }
}
