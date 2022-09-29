variable "vpc-name" {
  default         = "myvpc"
  type            =  string
}
variable "cidr_block" {
  default         = "20.0.0.0/16"
  type            =  string
}
variable "availability-zones" {
  description     = "availability zones"
  default         = ["us-east-1a", "us-east-1b"]
  type            = list(string)
}
variable "public_subnets" {
  description      = "Range of public subnets"
  default          = ["20.0.11.0/24", "20.0.12.0/24"]
  type             = list(string)
}

variable "private_subnets" {
  description = "Range of private subnets"
  default     = ["20.0.1.0/24", "20.0.2.0/24"]
  type        = list(string)

}

variable "database_subnets" {
  description      = "Range of public subnets"
  default          = ["20.0.21.0/24", "20.0.22.0/24"]
  type             = list(string)
}
variable "create_database_subnet_route_table" {
  default         = true
  type            = bool

}
variable "create_database_subnet_group" {
  default         = true
  type            = bool
}
variable "enable_nat_gateway" {
  default         = true
  type            = bool
}
variable "single_nat_gateway" {
  default         = true
  type            = bool
}
