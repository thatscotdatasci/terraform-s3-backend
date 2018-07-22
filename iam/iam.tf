variable "s3_state_bucket_name" {}
variable "s3_state_bucket_key_prefix" {}
variable "s3_state_bucket_id" {}

data "template_file" "s3_bucket_iam_statement" {
  template = "${file("${path.module}/templates/s3_bucket_iam_statement.tpl")}"

  vars {
    s3_state_bucket_name = "${var.s3_state_bucket_name}"
    s3_state_bucket_key_prefix = "${var.s3_state_bucket_key_prefix}"
  }
}

resource "aws_iam_policy" "s3_state_bucket_iam_policy" {
  name        = "${var.s3_state_bucket_id}-iam-policy"
  path        = "/"
  description = "IAM policy for accessing terraform state in the S3 bucket ${var.s3_state_bucket_id}"

  policy = "${data.template_file.s3_bucket_iam_statement.rendered}"
}
