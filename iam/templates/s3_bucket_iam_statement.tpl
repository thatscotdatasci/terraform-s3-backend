{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:ListBucket",
        "s3:PutObject"
      ],
      "Resource": [
        "arn:aws:s3:::${s3_state_bucket_name}",
        "arn:aws:s3:::${s3_state_bucket_name}/${s3_state_bucket_key_prefix}"
      ],
      "Effect": "Allow"
    }
  ]
}
