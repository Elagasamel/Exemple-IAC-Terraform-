resource "aws_iam_role" "jupiterone" {
  name = "JupiterOne"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "var.acctID"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "var.extId"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_policy" "jupiterone_security_audit_policy" {
  name = "JupiterOneSecurityAudit"

  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement" : [{
    "Effect" : "Allow",
    "Resource" : "*",
    "Action" : [
      "access-analyzer:List*",
      "batch:Describe*",
      "batch:List*",
      "cloudhsm:DescribeBackups",
      "cloudhsm:DescribeClusters",
      "cloudhsm:ListTags",
      "cloudwatch:GetMetricData",
      "cloudwatch:List*",
      "dynamodb:Describe*",
      "dynamodb:List*",
      "ec2:GetEbsDefaultKmsKeyId",
      "ec2:GetEbsEncryptionByDefault",
      "ecr:Describe*",
      "ecr:GetLifecyclePolicy",
      "ecr:GetRepositoryPolicy",
      "ecr:List*",
      "elasticache:List*",
      "elasticfilesystem:Describe*",
      "elasticmapreduce:List*",
      "es:List*",
      "kinesis:Describe*",
      "kinesis:List*",
      "lambda:GetFunction",
      "macie2:GetFindings",
      "macie2:ListFindings",
      "s3:GetObjectRetention",
      "s3:GetObjectLegalHold",
      "s3:Get*Configuration",
      "shield:GetSubscriptionState",
      "sns:GetTopicAttributes",
      "sns:GetSubscriptionAttributes",
      "sns:ListTopics",
      "sns:ListSubscriptions",
      "sns:ListTagsForResource",
      "waf:List*",
      "waf:Get*",
      "waf-regional:List*",
      "waf-regional:Get*",
      "workspaces:List*"
    ]
  },
  {
      "Effect": "Allow",
      "Action": [
        "apigateway:GET"
      ],
      "Resource": [
        "arn:aws:apigateway:*::/*"
      ]
  }]
}
EOF
}

resource "aws_iam_role_policy_attachment" "jupiterone_security_audit_policy_attachment" {
  role       = "${ aws_iam_role.jupiterone.name }"
  policy_arn = "${ aws_iam_policy.jupiterone_security_audit_policy.arn }"
}

resource "aws_iam_role_policy_attachment" "aws_security_audit_policy_attachment" {
  role       = "${ aws_iam_role.jupiterone.name }"
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

output "aws_iam_role_jupiterone_role_arn" {
  value = "${aws_iam_role.jupiterone.arn}"
}