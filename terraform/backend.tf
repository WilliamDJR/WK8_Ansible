terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 4.16"
        }
    }

    required_version = ">= 1.1.0"
}

provider "aws" {
  region  = "ap-southeast-2"
}


terraform {
    backend "s3" {
        encrypt              = true
        bucket               = "tfstate-willido" //change to your own
        //bucket               = "evolt-failover-sydney-tfstate"
        region               = "ap-southeast-2"
        key                  = "ansible-demo-tf.tfstate" //change to your own
    }
}
