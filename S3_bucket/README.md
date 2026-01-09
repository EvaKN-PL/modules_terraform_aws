🛡️ AWS S3 Bucket Terraform Module

A Terraform module for deploying secure, production-ready S3 buckets according to the latest AWS Security Best Practices.

🚀 Features

  📦 ```Bucket Provisioning```: Creates a standard S3 bucket with custom naming and environment-based tagging.
  
  🔑 ```Encryption```: Enables mandatory AES256 Server-Side Encryption (SSE-S3) by default.

  🕒 ```Versioning```: Supports object versioning to protect against accidental overwrites or deletions.

  💻 Usage Example
```hcl
  module "s3" {
  source = "./modules/s3_bucket"

  bucket_name       = "my-unique-project-data-dev"
  env               = "dev"
  versioning_status = "Enabled" # Options: Enabled / Suspended
}
```

📥 Inputs
| Name              | Description                               | Type   | Default        | Required |
|-------------------|-------------------------------------------|--------|----------------|----------|
| bucket_name       | The globally unique name of the S3 bucket | string |       n/a      |    yes   |
| env               | Environment name (e.g., dev, prod)        | string |       n/a      |    yes   |
| versioning_status | Status of the bucket versioning           | string |    "Enabled"   |    no    |
| region            | Region in AWS                             | string | "eu-central-1" |    yes   |


📤 Outputs
| Name       | Description          |
|------------|----------------------|
| bucket_arn | The Amazon Resource Name (ARN) |
| bucket_id  | ID of bucket         |
