#--------------- SageMaker notebook instance ------------------
resource "aws_sagemaker_notebook_instance" "this" {
  name                   = var.name
  instance_type          = var.instance_type
  volume_size            = var.volume_size
  subnet_id              = var.subnet_id
  security_groups        = var.security_groups
  kms_key_id             = var.kms_key_id
  direct_internet_access = var.direct_internet_access
  role_arn               = var.sagemaker_iam_role_arn

  lifecycle_config_name   = aws_sagemaker_notebook_instance_lifecycle_configuration.this.name
  default_code_repository = var.repository_name != null ? aws_sagemaker_code_repository.this[0].code_repository_name : null
}

#  SageMaker notebook lifecycle configuration
resource "aws_sagemaker_notebook_instance_lifecycle_configuration" "this" {
  name     = var.notebook_lifecycle_configuration_name
  on_start = filebase64("${path.module}/scripts/on-start.sh")
}

#  Git repo to attach the SageMaker notebook instance
resource "aws_sagemaker_code_repository" "this" {
  count = var.repository_name != null ? 1 : 0

  code_repository_name = var.repository_name

  git_config {
    repository_url = var.repository_url
    branch         = var.repository_branch
    secret_arn     = var.secret_arn
  }
}
