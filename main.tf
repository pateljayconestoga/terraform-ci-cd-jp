provider "aws" {
    region = "us-east-1"
}

# Need to save state file on S3, so we can destoy it.
terraform {
  backend "s3" {
    bucket = "terraform-state-lab10-jp"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "vk0861"{
    ami = "ami-08a6efd148b1f7504"
    instance_type = "t2.micro"
    count = var.core_count

    tags = {
      Name = "Lab-10-JP"
    }
}