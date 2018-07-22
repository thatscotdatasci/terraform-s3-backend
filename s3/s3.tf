variable "s3_state_bucket_name" {}

resource "aws_s3_bucket" "s3_state_bucket" {
  bucket = "${var.s3_state_bucket_name}"
  acl = "private"

  versioning {
    enabled = true
  }
}

output "s3_state_bucket_id" { value =  "${aws_s3_bucket.s3_state_bucket.id}" }
