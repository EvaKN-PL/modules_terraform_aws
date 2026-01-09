provider "aws" {
    region = var.region
  
}

module "s3" {
    source = "./modules"

    bucket_name       = "my-bucket-9979-dev"
    versioning_status = "Enabled"
    env               = "dev"
  
}