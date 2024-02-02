variable "name" {
  type        = string
  description = "security group name"
  default     = "tf-sg"
}
variable "rules_for_sg" {
  type = list(object({
    protocol    = string
    port        = string
    description = string
    ips         = list(string)
  }))
  default = [{
    protocol    = "tcp"
    port        = "22"
    description = "ssh"
    ips         = ["0.0.0.0/0"]
    },
    {
      protocol    = "tcp"
      port        = "80"
      description = "http"
      ips         = ["0.0.0.0/0"]
    },
    {
      protocol    = "tcp"
      port        = "443"
      description = "https"
      ips         = ["0.0.0.0/0"]
  }]
}
