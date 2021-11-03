resource "aws_iam_policy" "ghactions_iam_policy" {
  name   = var.ghactions_iam_policy_name
  policy = data.aws_iam_policy_document.ghactions_aws_iam_policy_document.json
}

resource "aws_iam_user_policy_attachment" "ghactions_iam_user_policy_attachment" {
  policy_arn = aws_iam_policy.ghactions_iam_policy.arn
  user       = var.user_name
}

data "aws_iam_policy_document" "ghactions_aws_iam_policy_document" {
  statement {
    sid = ""
    actions = [
      "ec2:DeregisterImage",
      "ec2:CreateImage",
      "ec2:CopyImage",
      "ec2:ModifyImageAttribute",
      "ec2:ReplaceIamInstanceProfileAssociation",
      "ec2:ModifyInstanceAttribute",
      "ec2:CreateInstanceExportTask",
      "ec2:TerminateInstances",
      "ec2:RegisterImage",
      "ec2:RunInstances",
      "ec2:StopInstances",
      "ec2:DescribeImageAttribute",
      "ec2:AssociateIamInstanceProfile",
    ]
    resources = ["arn:aws:ec2:us-east-1::image/*",
      "arn:aws:ec2:us-east-1:${var.user_id}:instance/*"]
    effect = "Allow"
  }
  statement {
    actions   = ["iam:PassRole"]
    resources = ["arn:aws:iam::${var.user_id}:role/*"]
    effect    = "Allow"
  }
}
