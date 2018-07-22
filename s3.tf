provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

data "template_file" "s3_bucket_iam_statement" {
  template = "${file("templates/s3_bucket_iam_statement.tpl")}"

  vars {
    s3_state_bucket_name = "${var.s3_state_bucket_name}"
    s3_state_bucket_key_prefix = "${var.s3_state_bucket_key_prefix}"
  }
}

resource "aws_s3_bucket" "s3_state_bucket" {
  bucket = "${var.s3_state_bucket_name}"
  acl = "private"

  versioning {
    enabled = true
  }
}

resource "aws_iam_policy" "s3_state_bucket_iam_policy" {
  name        = "${aws_s3_bucket.s3_state_bucket.id}_iam_policy"
  path        = "/"
  description = "IAM policy for accessing terraform state in the S3 bucket ${aws_s3_bucket.s3_state_bucket.id}"

  policy = "${data.template_file.s3_bucket_iam_statement.rendered}"
}
