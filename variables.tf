variable "name" {
  description = "Name of notebook"
  type        = string
  default     = "mlops-sagemaker-notebook"
}

variable "instance_type" {
  description = "Notebook instance type"
  type        = string
  default     = "ml.t2.medium"
}

variable "volume_size" {
  description = "(Optional) The size, in GB, of the ML storage volume to attach to the notebook instance. The default value is 5 GB."
  type        = number
  default     = 5
}

variable "direct_internet_access" {
  description = "(Optional) Set to Disabled to disable internet access to notebook. Requires security_groups and subnet_id to be set. Supported values: Enabled (Default) or Disabled. If set to Disabled, the notebook instance will be able to access resources only in your VPC, and will not be able to connect to Amazon SageMaker training and endpoint services unless your configure a NAT Gateway in your VPC."
  type        = string
  default     = "Disabled"
}

variable "subnet_id" {
  description = "(Optional) The VPC subnet ID."
  type        = string
  default     = null
}

variable "security_groups" {
  description = "(Optional) The associated security groups."
  type        = list(string)
  default     = []
}

variable "notebook_lifecycle_configuration_name" {
  description = "(Optional) The name of the lifecycle configuration (must be unique). If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = "mlops-notebook-lifecycle-config"
}

variable "create_iam_role" {
  description = "Flag to create IAM role or not"
  type        = bool
  default     = false
}

variable "iam_role_name" {
  description = "(Optional) AWS IAM role name"
  type        = string
  default     = null
}

variable "aws_managed_policies_arn" {
  description = "(Optional) AWS managed policies arn for IAM role"
  type        = list(string)
  default     = []
}

variable "sagemaker_iam_role_arn" {
  description = "(Optional) AWS IAM role arn, this required if create_iam_role is false."
  type        = string
  default     = null
}

variable "repository_name" {
  description = "(Optional) The name of the Code Repository (must be unique)."
  type        = string
  default     = null
}

variable "repository_url" {
  description = "(Required) The URL where the Git repository is located."
  type        = string
  default     = null
}

variable "repository_branch" {
  description = "(Required) Git repository branch name."
  type        = string
  default     = "main"
}

variable "secret_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) of the AWS Secrets Manager secret that contains the credentials used to access the git repository. The secret must have a staging label of AWSCURRENT and must be in the following format: {\"username\": UserName, \"password\": Password}."
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "(Optional) The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption."
  type        = string
  default     = null
}

variable "tags" {
  description = "Resource tags"
  type        = map(any)
  default     = {}
}
