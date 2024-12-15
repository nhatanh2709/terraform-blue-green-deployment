provider "aws" {
    region = "ap-southeast-2"
}

module "base" {
    source = "terraform-in-action/aws/bluegreen//modules/base"
    production = var.production
}

module "green" {
    source = "terraform-in-action/aws/bluegreen//modules/autoscaling"
    app_version = "v1.0"
    label = "green"
    base = module.base
}