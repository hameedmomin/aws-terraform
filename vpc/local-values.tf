locals {
  owners         = var.busines
  name           = "${var.environment}-${var.busines}"
#  name           = "${local.busines}-${local.environment}"
  environment    = var.environment

  common_tags    = {
    owner        = local.owners
    environment  = local.environment
  }
}