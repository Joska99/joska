variable "name" {
  type        = string
  description = "vm name"
}
variable "type" {
  type        = string
  description = "vm type"
  # default     = "t2.micro"
}
variable "az" {
  type        = string
  description = "vm az"
  # default     = "us-east-1a"
}
variable "ssh_key" {
  type        = string
  description = "name of key pair"
}
variable "sub_id" {
  type        = string
  description = "subnet id"
}
variable "sg_ids" {
  type        = list(string)
  description = "list of security groups id"
}
variable "ami_id" {
  type        = string
  description = "ubuntu 22.04 ami"
  # default     = "ami-0c7217cdde317cfec"
}
