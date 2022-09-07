data "digitalocean_tag" "base" {
  name = var.tag_name
}

resource "digitalocean_firewall" "base" {
  name = "base"
  tags = [data.digitalocean_tag.base.name]

  # Ping
  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # SSH
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = var.trusted_ip_addresses
  }

  # Ping
  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  # Whois
  outbound_rule {
    protocol              = "tcp"
    port_range            = "43"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  # DNS
  outbound_rule {
    protocol              = "tcp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  # DNS
  outbound_rule {
    protocol              = "udp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  # HTTP
  outbound_rule {
    protocol              = "tcp"
    port_range            = "80"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  # NTP
  outbound_rule {
    protocol              = "udp"
    port_range            = "123"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  # HTTPS
  outbound_rule {
    protocol              = "tcp"
    port_range            = "443"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  # NTS
  outbound_rule {
    protocol              = "tcp"
    port_range            = "4460"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 1.2.0"
    }
  }
}
