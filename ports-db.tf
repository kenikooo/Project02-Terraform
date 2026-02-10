# Cloud-WEB01
resource "openstack_networking_port_v2" "port_internal_db01" {
  name           = "port_int-db01"
  network_id     = openstack_networking_network_v2.network_internal.id
  admin_state_up = true
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_internal.id
    ip_address = "192.168.10.5"
  }
}

resource "openstack_networking_port_v2" "port_mgmt_db01" {
  name           = "port_mgmt-db01"
  network_id     = var.mgmt_net
  admin_state_up = true
  fixed_ip {
    subnet_id  = var.mgmt_sub
    ip_address = "192.168.10.69"
  }
}


# Cloud-WEB02
resource "openstack_networking_port_v2" "port_internal_db02" {
  name           = "port_int-db02"
  network_id     = openstack_networking_network_v2.network_internal.id
  admin_state_up = true
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_internal.id
    ip_address = "192.168.10.6"
  }
}

resource "openstack_networking_port_v2" "port_mgmt_db02" {
  name           = "port_mgmt-db02"
  network_id     = var.mgmt_net
  admin_state_up = true
  fixed_ip {
    subnet_id  = var.mgmt_sub
    ip_address = "192.168.10.70"
  }
}
