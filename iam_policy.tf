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
    actions = [
        "ec2:AttachVolume",
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:CopyImage",
        "ec2:CreateImage",
        "ec2:CreateKeypair",
        "ec2:CreateSecurityGroup",
        "ec2:CreateSnapshot",
        "ec2:CreateTags",
        "ec2:CreateVolume",
        "ec2:DeleteKeyPair",
        "ec2:DeleteSecurityGroup",
        "ec2:DeleteSnapshot",
        "ec2:DeleteVolume",
        "ec2:DeregisterImage",
        "ec2:DescribeImageAttribute",
        "ec2:DescribeImages",
        "ec2:DescribeInstances",
        "ec2:DescribeInstanceStatus",
        "ec2:DescribeRegions",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeSnapshots",
        "ec2:DescribeSubnets",
        "ec2:DescribeTags",
        "ec2:DescribeVolumes",
        "ec2:DetachVolume",
        "ec2:GetPasswordData",
        "ec2:ModifyImageAttribute",
        "ec2:ModifyInstanceAttribute",
        "ec2:ModifySnapshotAttribute",
        "ec2:RegisterImage",
        "ec2:RunInstances",
        "ec2:StopInstances",
        "ec2:TerminateInstances"
      ]
    resources = ["*"]
    effect = "Allow"
  }
  statement {
    actions   = ["iam:PassRole", "iam:GetInstanceProfile", "iam:CreateServiceLinkedRole"]
    resources = ["*"]
    effect    = "Allow"
  }
}
