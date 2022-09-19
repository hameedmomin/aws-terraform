locals {
  owners         = var.bussiness
  name           = "${var.environment}-${var.bussiness}"
#  name           = "${local.bussiness}-${local.environment}"
  environment    = var.environment

  common_tags    = {
    owner        = local.owners
    environment  = local.environment
  }
}