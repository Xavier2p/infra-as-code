// Create a `scariff.tfvars` to store the values of the variables.

variable "domain_name" {
  type        = string
  default     = "rpi.srv"
  description = "Domain name for the server"
}

variable "hostname" {
  type        = string
  default     = "scariff"
  description = "Name of the server"
}
