terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "2.1.0"
    }
  }
}

provider "openstack" {
  auth_url    = "https://cyberinfra1.ssa2026.region:5000/v3"
  tenant_name = "Project02"
  user_name   = "Competitor02"
  password    = "XQ68I3SEE1mq3kOogkSL"
  insecure    = true
}
