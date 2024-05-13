data "aws_iam_policy_document" "common-reusable" {
  for_each = var.custom_policy_names
  statement {
    sid= "kmsSpecific"
    actions= [
        "kms:Decrypt",
        "kms:DescribeKey",
        "kms:Encrypt",
        "kms:GenerateDataKey",
        "kms:GenerateDataKeyPair",
        "kms:GenerateDataKeyPairWithoutPlaintext",
        "kms:GenerateDataKeyWithoutPlaintext",
        "kms:ReEncryptFrom",
        "kms:ReEncryptTo",
      ]
    resources = [
      "arn:aws:kms:${var.region}:${var.aws_account_number}:key/${var.kms-id}"
    ]
  }
  statement {
    sid = "S3"
    actions = [  
       "s3:ListAccessPointsForObjectLambda",
                "s3:DeleteAccessPoint",
                "s3:DeleteAccessPointForObjectLambda",
                "s3:DeleteJobTagging",
                "s3:PutLifecycleConfiguration",
                "s3:PutObjectTagging",
                "s3:DeleteObject",
                "s3:CreateMultiRegionAccessPoint",
                "s3:PutAccessPointPolicyForObjectLambda",
                "s3:PutAccountPublicAccessBlock",
                "s3:GetBucketWebsite",
                "s3:PutMultiRegionAccessPointPolicy",
                "s3:DeleteStorageLensConfigurationTagging",
                "s3:GetMultiRegionAccessPoint",
                "s3:PutReplicationConfiguration",
                "s3:GetObjectAttributes",
                "s3:DeleteObjectVersionTagging",
                "s3:InitiateReplication",
                "s3:GetObjectLegalHold",
                "s3:GetBucketNotification",
                "s3:DeleteBucketPolicy",
                "s3:GetReplicationConfiguration",
                "s3:DescribeMultiRegionAccessPointOperation",
                "s3:PutObject",
                "s3:PutBucketNotification",
                "s3:PutObjectVersionAcl",
                "s3:PutAccessPointPublicAccessBlock",
                "s3:CreateJob",
                "s3:PutBucketObjectLockConfiguration",
                "s3:PutAccessPointPolicy",
                "s3:GetStorageLensDashboard",
                "s3:GetLifecycleConfiguration",
                "s3:GetBucketTagging",
                "s3:GetInventoryConfiguration",
                "s3:GetAccessPointPolicyForObjectLambda",
                "s3:ReplicateTags",
                "s3:ListBucket",
                "s3:AbortMultipartUpload",
                "s3:PutBucketTagging",
                "s3:UpdateJobPriority",
                "s3:DeleteBucket",
                "s3:PutBucketVersioning",
                "s3:GetMultiRegionAccessPointPolicyStatus",
                "s3:ListBucketMultipartUploads",
                "s3:PutIntelligentTieringConfiguration",
                "s3:PutMetricsConfiguration",
                "s3:PutStorageLensConfigurationTagging",
                "s3:PutObjectVersionTagging",
                "s3:GetBucketVersioning",
                "s3:GetAccessPointConfigurationForObjectLambda",
                "s3:PutInventoryConfiguration",
                "s3:GetMultiRegionAccessPointRoutes",
                "s3:ObjectOwnerOverrideToBucketOwner",
                "s3:GetStorageLensConfiguration",
                "s3:DeleteStorageLensConfiguration",
                "s3:GetAccountPublicAccessBlock",
                "s3:PutBucketWebsite",
                "s3:ListAllMyBuckets",
                "s3:PutBucketRequestPayment",
                "s3:PutObjectRetention",
                "s3:CreateAccessPointForObjectLambda",
                "s3:GetBucketCORS",
                "s3:DeleteAccessPointPolicy",
                "s3:GetObjectVersion",
                "s3:PutAnalyticsConfiguration",
                "s3:PutAccessPointConfigurationForObjectLambda",
                "s3:GetObjectVersionTagging",
                "s3:PutStorageLensConfiguration",
                "s3:CreateBucket",
                "s3:GetStorageLensConfigurationTagging",
                "s3:ReplicateObject",
                "s3:GetObjectAcl",
                "s3:GetBucketObjectLockConfiguration",
                "s3:DeleteBucketWebsite",
                "s3:GetIntelligentTieringConfiguration",
                "s3:DeleteAccessPointPolicyForObjectLambda",
                "s3:GetObjectVersionAcl",
                "s3:PutBucketAcl",
                "s3:DeleteObjectTagging",
                "s3:GetBucketPolicyStatus",
                "s3:GetObjectRetention",
                "s3:GetJobTagging",
                "s3:ListJobs",
                "s3:PutObjectLegalHold",
                "s3:PutBucketCORS",
                "s3:ListMultipartUploadParts",
                "s3:GetObject",
                "s3:DescribeJob",
                "s3:PutBucketLogging",
                "s3:GetAnalyticsConfiguration",
                "s3:GetObjectVersionForReplication",
                "s3:GetAccessPointForObjectLambda",
                "s3:CreateAccessPoint",
                "s3:GetAccessPoint",
                "s3:PutAccelerateConfiguration",
                "s3:SubmitMultiRegionAccessPointRoutes",
                "s3:DeleteObjectVersion",
                "s3:GetBucketLogging",
                "s3:ListBucketVersions",
                "s3:RestoreObject",
                "s3:GetAccelerateConfiguration",
                "s3:GetObjectVersionAttributes",
                "s3:GetBucketPolicy",
                "s3:PutEncryptionConfiguration",
                "s3:GetEncryptionConfiguration",
                "s3:GetObjectVersionTorrent",
                "s3:GetBucketRequestPayment",
                "s3:GetAccessPointPolicyStatus",
                "s3:GetObjectTagging",
                "s3:GetBucketOwnershipControls",
                "s3:GetMetricsConfiguration",
                "s3:PutObjectAcl",
                "s3:GetBucketPublicAccessBlock",
                "s3:PutBucketPublicAccessBlock",
                "s3:GetMultiRegionAccessPointPolicy",
                "s3:GetAccessPointPolicyStatusForObjectLambda",
                "s3:ListAccessPoints",
                "s3:PutBucketOwnershipControls",
                "s3:DeleteMultiRegionAccessPoint",
                "s3:PutJobTagging",
                "s3:ListMultiRegionAccessPoints",
                "s3:UpdateJobStatus",
                "s3:GetBucketAcl",
                "s3:BypassGovernanceRetention",
                "s3:ListStorageLensConfigurations",
                "s3:GetObjectTorrent",
                "s3:PutBucketPolicy",
                "s3:GetBucketLocation",
                "s3:GetAccessPointPolicy",
                "s3:ReplicateDelete",
    ]
    resources = [ 
      "arn:aws:s3:::${var.cdh_source_bucket_name}",
      "arn:aws:s3:::${var.cdh_source_bucket_name}/*",
     ]
  }
}

resource "aws_iam_policy" "custom_policy_creation" {
  for_each = data.aws_iam_policy_document.common-reusable
  name = "${each.key}"
  description = "Common s3 and KMS permission"
  path = "/"
  policy = data.aws_iam_policy_document.common-reusable[each.key].json
}


#role creation


resource "aws_iam_role" "lambda_role" {
  name = "${var.project_name}-ovc-${var.project_env}-lambda-test-role-tf"
    # name= "cdh-ovc-dev-lambda-test-role"
    description = "Allows Lambda functions to call AWS services on your behalf."
# cdh-ovc-dev-lambda-test-role 
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "Glue_permission" {
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSGlueConsoleFullAccess"
}
resource "aws_iam_role_policy_attachment" "S3_permission" {
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}


resource "aws_iam_role" "Glue_role" {
  name = "${var.project_name}-ovc-${var.project_env}-${var.glue_role_name}-role-tf"
    # name= "cdh-ovc-dev-buss-test-glue-role"
    description = "Allows Lambda functions to call AWS services on your behalf."
# cdh-ovc-dev-lambda-test-role 
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "glue.amazonaws.com"
        }
      },
    ]
  })
}   

resource "aws_iam_role_policy_attachment" "Glue_permission_1" {
  role = aws_iam_role.Glue_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSGlueConsoleFullAccess"
}
resource "aws_iam_role_policy_attachment" "S3_permission_1" {
  role = aws_iam_role.Glue_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}


resource "aws_iam_role_policy_attachment" "custom_policy_attach" {
  for_each = data.aws_iam_policy_document.common-reusable
  role = aws_iam_role.Glue_role.name
  policy_arn = aws_iam_policy.custom_policy_creation[each.key].arn
}


