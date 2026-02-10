# Internal Network
resource "openstack_networking_network_v2" "network_internal" {
  name = "Internal-Net"
}
resource "openstack_networking_subnet_v2" "subnet_internal" {
  name            = "Internal-Subnet"
  network_id      = openstack_networking_network_v2.network_internal.id
  cidr            = "192.168.10.0/26"
  gateway_ip      = "192.168.10.62"
  enable_dhcp     = false
  ip_version      = 4
  dns_nameservers = ["8.8.8.8"]
}

# External Network
resource "openstack_networking_network_v2" "network_external" {
  name = "External-Net"
}
resource "openstack_networking_subnet_v2" "subnet_external" {
  name            = "External-Subnet"
  network_id      = openstack_networking_network_v2.network_external.id
  cidr            = "172.16.1.0/28"
  gateway_ip      = "172.16.1.14"
  enable_dhcp     = false
  ip_version      = 4
  dns_nameservers = ["8.8.8.8"]
}

# Backup Network
resource "openstack_networking_network_v2" "network_backup" {
  name = "Backup-Net"
}
resource "openstack_networking_subnet_v2" "subnet_backup" {
  name            = "Backup-Subnet"
  network_id      = openstack_networking_network_v2.network_backup.id
  cidr            = "192.168.10.128/27"
  gateway_ip      = "192.168.10.158"
  enable_dhcp     = false
  ip_version      = 4
  dns_nameservers = ["8.8.8.8"]
}
