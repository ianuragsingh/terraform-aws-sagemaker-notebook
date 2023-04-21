#-------- The SageMaker IAM role and "Assume Role" policy ----------

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    
    principals {
      type = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  count = create_iam_role ? 1 : 0

  name = var.iam_role_name != null ? var.iam_role_name : "${var.name}-iam-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  count      = length(var.aws_managed_policies_arn) == 0 ? 0 : length(var.aws_managed_policies_arn)
  
  role       = aws_iam_role.this.name
  policy_arn = var.aws_managed_policies_arn[count.index]
}
