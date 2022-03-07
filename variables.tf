
variable "vpc" {
  description = "The AWS_VPC that the NAT instance will be in."
}

variable "subnets" {
  description = "A list of AWS Subnets from the Public Networks that NAT Instances can be launched into."
}

variable "instance_type" {
  default = "t3.micro"
}

variable "route_tables" {
  description = "A list of AWS Route Tables from the Private Networks that should route to NAT."
}

variable "max_availability_zones" {
  description = "The number of availablity zones to launch in. This should match the route_tables and subnets count."
}

variable "high_availability" {
  description = "When enabled servers will be launched in each subnet."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to all resources."
  default     = {}
}

locals {
  common_tags = merge(var.tags, { "Name" : try("${var.tags["Name"]}-NAT", "${var.vpc.id}-NAT") })
}
