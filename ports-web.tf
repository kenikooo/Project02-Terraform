# Cloud-WEB01
resource "openstack_networking_port_v2" "port_internal_web01" {
  name           = "port_int-web01"
  network_id     = openstack_networking_network_v2.network_internal.id
  admin_state_up = true
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_internal.id
    ip_address = "192.168.10.3"
  }
}

resource "openstack_networking_port_v2" "port_mgmt_web01" {
  name           = "port_mgmt-web01"
  network_id     = var.mgmt_net
  admin_state_up = true
  fixed_ip {
    subnet_id  = var.mgmt_sub
    ip_address = "192.168.10.67"
  }
}


# Cloud-WEB02
resource "openstack_networking_port_v2" "port_internal_web02" {
  name           = "port_int-web02"
  network_id     = openstack_networking_network_v2.network_internal.id
  admin_state_up = true
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_internal.id
    ip_address = "192.168.10.4"
  }
}

resource "openstack_networking_port_v2" "port_mgmt_web02" {
  name           = "port_mgmt-web02"
  network_id     = var.mgmt_net
  admin_state_up = true
  fixed_ip {
    subnet_id  = var.mgmt_sub
    ip_address = "192.168.10.68"
  }
}
