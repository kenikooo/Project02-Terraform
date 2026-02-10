# Cloud-BACKUP01
resource "openstack_networking_port_v2" "port_backup_backup01" {
  name           = "port_int-backup01"
  network_id     = openstack_networking_network_v2.network_backup.id
  admin_state_up = true
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_backup.id
    ip_address = "192.168.10.131"
  }
}

resource "openstack_networking_port_v2" "port_mgmt_backup01" {
  name           = "port_mgmt-backup01"
  network_id     = var.mgmt_net
  admin_state_up = true
  fixed_ip {
    subnet_id  = var.mgmt_sub
    ip_address = "192.168.10.73"
  }
}


# Cloud-BACKUP02
resource "openstack_networking_port_v2" "port_backup_backup02" {
  name           = "port_int-backup02"
  network_id     = openstack_networking_network_v2.network_backup.id
  admin_state_up = true
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_backup.id
    ip_address = "192.168.10.132"
  }
}

resource "openstack_networking_port_v2" "port_mgmt_backup02" {
  name           = "port_mgmt-backup02"
  network_id     = var.mgmt_net
  admin_state_up = true
  fixed_ip {
    subnet_id  = var.mgmt_sub
    ip_address = "192.168.10.74"
  }
}
