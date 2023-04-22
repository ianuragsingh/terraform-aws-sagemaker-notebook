
module "notebook" {
  source = "./.."

  name            = "sagemaker-testing-notebook"
  instance_type   = "ml.t2.medium"
  volume_size     = 5
  subnet_id       = "private_subnet_1a"   # Your subnet id, usually private subnet id
  #security_groups = [SG] // Your security group if any

  kms_key_id = aws_kms_key.sagemaker_kms_key.key_id 
  
  create_iam_role = true
  iam_role_name   = "sagemaker-notebook-iam-role"
  
  aws_managed_policies_arn = [
    "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  ]
}

resource "aws_kms_key" "sagemaker_kms_key" {
  description = "Sagemaker KMS key"
}