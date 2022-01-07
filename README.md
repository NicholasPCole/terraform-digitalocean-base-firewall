# Terraform DigitalOcean base firewall

This module creates a set of minimal firewall rules suitable for application to all Droplets in an account.

## Overview

A Cloud Firewall allowing ports for the following services will be created:

* Inbound: Ping, SSH
* Outbound: Ping, Whois, DNS, HTTP, HTTPS, NTS

A tag named "base" will also be created and added to the firewall. You will need to add this tag to any Droplets you create to apply the firewall.

SSH connections will only be allowed from trusted IP addresses specified in module input.

## Requirements

This module does not have any special requirements.

## Usage

Call the module like so:

```hcl
module "base_firewall" {
  source               = "https://github.com/NicholasPCole/terraform-digitalocean-base-firewall"
  
  trusted_ip_addresses = ["192.0.2.0/24", "203.0.113.50/32"]
}
```

