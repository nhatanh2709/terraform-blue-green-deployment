terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
    region = "ap-southeast-2"
}

module "base" {
  source     = "./modules/base"
  production = var.production
}

module "green" {
  source      = "./modules/autoscaling"
  app_version = "v1.0"
  label       = "green"
  base        = module.base
}