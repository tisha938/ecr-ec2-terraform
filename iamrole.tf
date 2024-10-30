resource "aws_iam_role" "ecr_access_role1" {
  name = "ecr_access_role1"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      }
    ]
  })
}

resource "aws_iam_role_policy" "ecr_access_policy1" {
  name   = "ecr_access_policy1"
  role   = aws_iam_role.ecr_access_role1.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:DescribeImages",
		  "ecr:ListImages",
				"ecr:DescribeRepositories"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ecr_profile1" {
  name = "ecr_instance_profile1"
  role = aws_iam_role.ecr_access_role1.name
}