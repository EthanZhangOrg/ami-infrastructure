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
      "ec2:AttachVolume",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:DeregisterImage",
      "ec2:DeleteTags",
      "ec2:CreateImage",
      "ec2:CreateVpc",
      "ec2:CopyImage",
      "ec2:ModifyImageAttribute",
      "ec2:ReplaceIamInstanceProfileAssociation",
      "ec2:UpdateSecurityGroupRuleDescriptionsIngress",
      "ec2:DeleteVolume",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:CreateSecurityGroup",
      "ec2:CreateSnapshot",
      "ec2:ModifyInstanceAttribute",
      "ec2:CreateInstanceExportTask",
      "ec2:DetachVolume",
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:UpdateSecurityGroupRuleDescriptionsEgress",
      "ec2:TerminateInstances",
      "ec2:CreateTags",
      "ec2:RegisterImage",
      "ec2:RunInstances",
      "ec2:ModifySecurityGroupRules",
      "ec2:StopInstances",
      "ec2:CreateVolume",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:GetPasswordData",
      "ec2:DescribeImageAttribute",
      "ec2:DeleteSecurityGroup",
      "ec2:DeleteVpc",
      "ec2:AssociateIamInstanceProfile",
      "ec2:ImportKeyPair",
      "ec2:CreateKeyPair",
      "ec2:DeleteKeyPair"
    ]
    resources = ["arn:aws:ec2:us-east-1:${var.user_id}:network-interface/*",
      "arn:aws:ec2:us-east-1::image/*",
      "arn:aws:ec2:us-east-1:${var.user_id}:instance/*",
      "arn:aws:ec2:us-east-1:${var.user_id}:vpc/*",
      "arn:aws:ec2:us-east-1:${var.user_id}:security-group/*",
      "arn:aws:ec2:us-east-1:${var.user_id}:volume/*",
      "arn:aws:ec2:us-east-1:${var.user_id}:subnet/*",
    "arn:aws:ec2:us-east-1:${var.user_id}:key-pair/*"]
    effect = "Allow"
  }
  statement {
    actions = ["ec2:DescribeInstances",
      "ec2:DescribeIamInstanceProfileAssociations",
      "ec2:DescribeTags",
      "ec2:DescribeRegions",
      "ec2:DescribeSnapshots",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeImages",
      "ec2:CreateDefaultVpc",
      "ec2:DescribeSecurityGroupRules",
      "ec2:DescribeSecurityGroupReferences",
      "ec2:DescribeVpcs",
      "ec2:DescribeVolumes",
      "ec2:DescribeSubnets",
      "ec2:DescribeKeyPairs",
      "ec2:DescribeInstanceStatus",
    "ec2:DescribeStaleSecurityGroups"]
    resources = ["*"]
    effect    = "Allow"
  }

  statement {
    actions   = ["iam:PassRole"]
    resources = ["arn:aws:iam::${var.user_id}:role/*"]
    effect    = "Allow"
  }
}
