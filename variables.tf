variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "eu-west-2"
}
variable "s3_state_bucket_name" {}
variable "s3_state_bucket_key_prefix" {
  default = ""
}
