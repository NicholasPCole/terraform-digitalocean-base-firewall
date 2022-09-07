# Terraform DigitalOcean base firewall

This module creates a set of minimal firewall rules suitable for application to all Droplets in an account.

## Overview

A Cloud Firewall allowing ports for the following services will be created:

* Inbound: Ping, SSH
* Outbound: Ping, Whois, DNS, HTTP, HTTPS, NTP, NTS

It will be applied to a tag that you create, named "base" by default. The tag is not provided by this module (to avoid circular dependencies when the tag is used by other resources).

SSH connections will only be allowed from trusted IP addresses specified in module input.

## Requirements

You will need a tag already created in your account to add to the firewall (and Droplets when you create them). By default, the "base" tag is used, but you can customize this variable.

## Usage

Call the module like so:

```hcl
module "base_firewall" {
  source               = "NicholasPCole/base-firewall/digitalocean"
  
  trusted_ip_addresses = ["192.0.2.0/24", "203.0.113.50/32"]
}
```

