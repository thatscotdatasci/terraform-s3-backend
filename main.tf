provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

module "s3" {
  source = "./s3"

  s3_state_bucket_name = "${var.s3_state_bucket_name}"
}

module "iam" {
  source = "./iam"

  s3_state_bucket_name = "${var.s3_state_bucket_name}"
  s3_state_bucket_key_prefix = "${var.s3_state_bucket_key_prefix}"
  s3_state_bucket_id = "${module.s3.s3_state_bucket_id}"
}
