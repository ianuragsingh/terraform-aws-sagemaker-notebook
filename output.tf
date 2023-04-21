
output "id" {
  description = "The name of the notebook instance."
  value       = aws_sagemaker_notebook_instance.this.id
}

output "arn" {
  description = "The Amazon Resource Name (ARN) assigned by AWS to this notebook instance."
  value       = aws_sagemaker_notebook_instance.this.arn
}

output "url" {
  description = "The URL that you use to connect to the Jupyter notebook that is running in your notebook instance."
  value       = aws_sagemaker_notebook_instance.this.url
}

output "network_interface_id" {
  description = "The network interface ID that Amazon SageMaker created at the time of creating the instance. Only available when setting subnet_id"
  value       = aws_sagemaker_notebook_instance.this.network_interface_id
}
