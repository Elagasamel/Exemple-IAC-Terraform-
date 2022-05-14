
resource "aws_iam_role" "lambda_iam" {
  name = "04-stock-lambda-enhancer"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "lambda_processor" {
  filename      = "04-stock-lambda-enhancer-1.0-aws.jar"
  function_name = "04-stock-lambda-enhancer"
  role          = aws_iam_role.lambda_iam.arn
  handler       = "com.metaarivu.AWSLambdaHandler"
  runtime       = "java8"
  timeout = 60
  memory_size = 256    
  
}


resource "aws_iam_role_policy" "lambda_policy" {
  name   = "04-stock-lambda-enhancer"
  role   = aws_iam_role.lambda_iam.id
  policy = file("04-stock-lambda-enhancer.json")
}


