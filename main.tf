resource "aws_iam_openid_connect_provider" "github_oidc" {
  tags            = var.tags
  client_id_list  = var.client_id_list
  thumbprint_list = [data.tls_certificate.github.certificates[0].sha1_fingerprint]
  url             = var.url
}

resource "aws_iam_role" "github_role" {
  description        = "Minimum permissions for Github actions automation"
  name               = "github_actions_automation"
  assume_role_policy = data.aws_iam_policy_document.assume_role_github_actions.json
}

resource "aws_iam_role_policy_attachment" "github_role_policy_attachement" {
  policy_arn = aws_iam_policy.github_role_policy.arn
  role       = aws_iam_role.github_role.name
}

resource "aws_iam_policy" "github_role_policy" {
  policy = data.aws_iam_policy_document.github_actions_role_policy.json
}

data "aws_iam_policy_document" "assume_role_github_actions" {
  statement {
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github_oidc.arn]
    }

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values = [
      "sts.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values   = [var.github_repo]
    }
  }
}

data "aws_iam_policy_document" "github_actions_role_policy" {

  statement {
    sid       = "stsallow"
    effect    = "Allow"
    actions   = ["sts:*"]
    resources = ["*"]
  }

  statement {
    sid    = "dynamolock"
    effect = "Allow"
    actions = [
      "dynamodb:CreateTable",
      "dynamodb:DeleteItem",
      "dynamodb:DeleteTable",
      "dynamodb:DescribeContinuousBackups",
      "dynamodb:DescribeTable",
      "dynamodb:DescribeTimeToLive",
      "dynamodb:GetItem",
      "dynamodb:ListTagsOfResource",
      "dynamodb:PutItem",
      "dynamodb:TagResource",
      "dynamodb:UntagResource",
      "dynamodb:UpdateTable",
      "dynamodb:UpdateTimeToLive"
    ]
    resources = ["*"]
  }

  statement {
    sid       = "iamgetuser"
    effect    = "Allow"
    actions   = ["iam:GetUser"]
    resources = ["*"]
  }

  statement {
    sid    = "kmskeys"
    effect = "Allow"
    actions = [
      "kms:CreateKey",
      "kms:DescribeKey",
      "kms:EnableKeyRotation",
      "kms:GetKeyPolicy",
      "kms:GetKeyRotationStatus",
      "kms:ListResourceTags",
      "kms:PutKeyPolicy",
      "kms:ScheduleKeyDeletion"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "s3bucket"
    effect = "Allow"
    actions = [
      "s3:CreateBucket",
      "s3:DeleteBucket",
      "s3:DeleteObject",
      "s3:GetAccelerateConfiguration",
      "s3:GetBucketAcl",
      "s3:GetBucketCORS",
      "s3:GetBucketLogging",
      "s3:GetBucketObjectLockConfiguration",
      "s3:GetBucketPolicy",
      "s3:GetBucketPublicAccessBlock",
      "s3:GetBucketRequestPayment",
      "s3:GetBucketTagging",
      "s3:GetBucketVersioning",
      "s3:GetBucketWebsite",
      "s3:GetEncryptionConfiguration",
      "s3:GetLifecycleConfiguration",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:GetReplicationConfiguration",
      "s3:ListBucket",
      "s3:PutBucketLogging",
      "s3:PutBucketPublicAccessBlock",
      "s3:PutBucketVersioning",
      "s3:PutEncryptionConfiguration",
      "s3:PutLifecycleConfiguration",
      "s3:PutObject"
    ]

    resources = ["*"]
  }
}
