// Create a `mandalore.tfvars` to store the values of the variables.

variable "domain_name" {
  type        = string
  default     = "rpi.srv"
  description = "Domain name for the server"
}

variable "server_name" {
  type        = string
  default     = "madalore"
  description = "Name of the server"
}
