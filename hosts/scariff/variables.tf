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

variable "path_downloads" {
  type        = string
  default     = "/downloads"
  description = "Path to the downloads folder"
}

variable "path_config" {
  type        = string
  default     = "/docker"
  description = "Path of the config folder"

}
