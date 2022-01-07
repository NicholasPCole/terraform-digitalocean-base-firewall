variable "trusted_ip_addresses" {
  type        = list(string)
  description = "A list of IP addresses allowed SSH access in the firewall."
}
