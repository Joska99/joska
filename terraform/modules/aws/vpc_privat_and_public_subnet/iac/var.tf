variable "aws_vpc" {
  type        = map(string)
  description = "vpc data"
  default = {
    name    = "vpc-tf"
    ip_cidr = "10.0.0.0/16"
  }
}

variable "aws_subnets" {
  type = map(object({
    name      = string
    ip_cidr   = string
    public_ip = string
  }))
  description = "subnets"
  default = {
    public_sub = {
      name      = "public-sub-tf"
      ip_cidr   = "10.0.1.0/24"
      public_ip = "true"
    }
    private_sub = {
      name      = "private-sub-tf"
      ip_cidr   = "10.0.2.0/24"
      public_ip = "false"
    }
  }
}

variable "internet_gw_name" {
  type        = string
  description = "internet gate way name"
  default     = "internet-gw-tf"
}

variable "nat_gw_name" {
  type        = string
  description = "nat gate way name"
  default     = "nat-gw-tf"
}
