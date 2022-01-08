variable "tag_name" {
  type        = string
  description = "Name of the tag that will be added to the firewall."
  default     = "base"
}

variable "trusted_ip_addresses" {
  type        = list(string)
  description = "A list of IP addresses allowed SSH access in the firewall."
}
