locals {
  owners         = var.division
  name           = "${var.environment}-${var.division}"
#  name           = "${local.bussiness}-${local.environment}"
  environment    = var.environment
  division       = var.division

  common_tags    = {
    owner        = local.owners
    environment  = local.environment
  }
}