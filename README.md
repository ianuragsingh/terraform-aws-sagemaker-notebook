## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.31 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.31 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_sagemaker_code_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_code_repository) | resource |
| [aws_sagemaker_notebook_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_notebook_instance) | resource |
| [aws_sagemaker_notebook_instance_lifecycle_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_notebook_instance_lifecycle_configuration) | resource |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_managed_policies_arn"></a> [aws\_managed\_policies\_arn](#input\_aws\_managed\_policies\_arn) | (Optional) AWS managed policies arn for IAM role | `list(string)` | `[]` | no |
| <a name="input_create_iam_role"></a> [create\_iam\_role](#input\_create\_iam\_role) | Flag to create IAM role or not | `bool` | `false` | no |
| <a name="input_direct_internet_access"></a> [direct\_internet\_access](#input\_direct\_internet\_access) | (Optional) Set to Disabled to disable internet access to notebook. Requires security\_groups and subnet\_id to be set. Supported values: Enabled (Default) or Disabled. If set to Disabled, the notebook instance will be able to access resources only in your VPC, and will not be able to connect to Amazon SageMaker training and endpoint services unless your configure a NAT Gateway in your VPC. | `string` | `"Disabled"` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | (Optional) AWS IAM role name | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Notebook instance type | `string` | `"ml.t2.medium"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | (Optional) The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of notebook | `string` | `"sample-sagemaker-notebook"` | no |
| <a name="input_notebook_lifecycle_configuration_name"></a> [notebook\_lifecycle\_configuration\_name](#input\_notebook\_lifecycle\_configuration\_name) | (Optional) The name of the lifecycle configuration (must be unique). If omitted, Terraform will assign a random, unique name. | `string` | `"mlops-notebook-lifecycle-config"` | no |
| <a name="input_repository_branch"></a> [repository\_branch](#input\_repository\_branch) | (Required) Git repository branch name. | `string` | `"main"` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | (Optional) The name of the Code Repository (must be unique). | `string` | `null` | no |
| <a name="input_repository_url"></a> [repository\_url](#input\_repository\_url) | (Required) The URL where the Git repository is located. | `string` | `null` | no |
| <a name="input_sagemaker_iam_role_arn"></a> [sagemaker\_iam\_role\_arn](#input\_sagemaker\_iam\_role\_arn) | (Optional) AWS IAM role arn, this required if create\_iam\_role is false. | `string` | `null` | no |
| <a name="input_secret_arn"></a> [secret\_arn](#input\_secret\_arn) | (Optional) The Amazon Resource Name (ARN) of the AWS Secrets Manager secret that contains the credentials used to access the git repository. The secret must have a staging label of AWSCURRENT and must be in the following format: {"username": UserName, "password": Password}. | `string` | `null` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | (Optional) The associated security groups. | `list(string)` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | (Optional) The VPC subnet ID. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `map(any)` | `{}` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | (Optional) The size, in GB, of the ML storage volume to attach to the notebook instance. The default value is 5 GB. | `number` | `5` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this notebook instance. |
| <a name="output_id"></a> [id](#output\_id) | The name of the notebook instance. |
| <a name="output_network_interface_id"></a> [network\_interface\_id](#output\_network\_interface\_id) | The network interface ID that Amazon SageMaker created at the time of creating the instance. Only available when setting subnet\_id |
| <a name="output_url"></a> [url](#output\_url) | The URL that you use to connect to the Jupyter notebook that is running in your notebook instance. |
