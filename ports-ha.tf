# Cloud-HA01
resource "openstack_networking_port_v2" "port_external_ha01" {
  name           = "port_ext-ha01"
  network_id     = openstack_networking_network_v2.network_external.id
  admin_state_up = true
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_external.id
    ip_address = "172.16.1.2"
  }
}

resource "openstack_networking_port_v2" "port_internal_ha01" {
  name           = "port_int-ha01"
  network_id     = openstack_networking_network_v2.network_internal.id
  admin_state_up = true
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_internal.id
    ip_address = "192.168.10.1"
  }
}

resource "openstack_networking_port_v2" "port_mgmt_ha01" {
  name           = "port_mgmt-ha01"
  network_id     = var.mgmt_net
  admin_state_up = true
  fixed_ip {
    subnet_id  = var.mgmt_sub
    ip_address = "192.168.10.65"
  }
}

# Cloud-HA02
resource "openstack_networking_port_v2" "port_external_ha02" {
  name           = "port_ext-ha02"
  network_id     = openstack_networking_network_v2.network_external.id
  admin_state_up = true
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_external.id
    ip_address = "172.16.1.3"
  }
}

resource "openstack_networking_port_v2" "port_internal_ha02" {
  name           = "port_int-ha02"
  network_id     = openstack_networking_network_v2.network_internal.id
  admin_state_up = true
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_internal.id
    ip_address = "192.168.10.2"
  }
}

resource "openstack_networking_port_v2" "port_mgmt_ha02" {
  name           = "port_mgmt-ha02"
  network_id     = var.mgmt_net
  admin_state_up = true
  fixed_ip {
    subnet_id  = var.mgmt_sub
    ip_address = "192.168.10.66"
  }
}



# Cloud-MON
resource "openstack_networking_port_v2" "port_backup_mon" {
  name           = "port_ext-ha02"
  network_id     = openstack_networking_network_v2.network_backup.id
  admin_state_up = true
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_backup.id
    ip_address = "192.168.10.129"
  }
}

resource "openstack_networking_port_v2" "port_mgmt_mon" {
  name           = "port_mgmt-mon"
  network_id     = var.mgmt_net
  admin_state_up = true
  fixed_ip {
    subnet_id  = var.mgmt_sub
    ip_address = "192.168.10.71"
  }
}
