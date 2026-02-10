# Cloud-HA01
resource "openstack_compute_instance_v2" "cloud_ha_01" {
  name         = "Cloud-HA01"
  flavor_id    = "100"
  config_drive = true
  user_data    = file("cloud-init.yml")
  network {
    port = openstack_networking_port_v2.port_external_ha01.id
  }
  network {
    port = openstack_networking_port_v2.port_mgmt_ha01.id
  }
  network {
    port = openstack_networking_port_v2.port_internal_ha01.id
  }
  security_groups = [
    openstack_networking_secgroup_v2.icmp.name,
    openstack_networking_secgroup_v2.ssh.name
  ]
  block_device {
    uuid                  = var.image_id
    source_type           = "image"
    volume_size           = 10
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
}

# Cloud-HA02
resource "openstack_compute_instance_v2" "cloud_ha_02" {
  name         = "Cloud-HA02"
  flavor_id    = "100"
  config_drive = true
  user_data    = file("cloud-init.yml")
  network {
    port = openstack_networking_port_v2.port_external_ha02.id
  }
  network {
    port = openstack_networking_port_v2.port_mgmt_ha02.id
  }
  network {
    port = openstack_networking_port_v2.port_internal_ha02.id
  }
  security_groups = [
    openstack_networking_secgroup_v2.icmp.name,
    openstack_networking_secgroup_v2.ssh.name
  ]
  block_device {
    uuid                  = var.image_id
    source_type           = "image"
    volume_size           = 10
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
}


# Cloud-MON
resource "openstack_compute_instance_v2" "cloud_mon" {
  name         = "Cloud-MON"
  flavor_id    = "84bab80a-1808-451c-a3c8-8c70c367c7e2"
  config_drive = true
  user_data    = file("cloud-init.yml")
  network {
    port = openstack_networking_port_v2.port_backup_mon.id
  }
  network {
    port = openstack_networking_port_v2.port_mgmt_mon.id
  }
  security_groups = [
    openstack_networking_secgroup_v2.icmp.name,
    openstack_networking_secgroup_v2.ssh.name
  ]
  block_device {
    uuid                  = var.image_id
    source_type           = "image"
    volume_size           = 10
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
}
