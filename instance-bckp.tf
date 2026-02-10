resource "openstack_blockstorage_volume_v3" "vol_1" {
  name = "backup-volume-1"
  size = 5
}
resource "openstack_blockstorage_volume_v3" "vol_2" {
  name = "backup-volume-2"
  size = 5
}

# Cloud-BACKUP01
resource "openstack_compute_instance_v2" "cloud_backup_01" {
  name         = "Cloud-BACKUP01"
  flavor_id    = "84bab80a-1808-451c-a3c8-8c70c367c7e2"
  config_drive = true
  user_data    = file("cloud-init.yml")
  network {
    port = openstack_networking_port_v2.port_mgmt_backup01.id
  }
  network {
    port = openstack_networking_port_v2.port_backup_backup01.id
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

# Cloud-BACKUP02
resource "openstack_compute_instance_v2" "cloud_backup_02" {
  name         = "Cloud-BACKUP02"
  flavor_id    = "84bab80a-1808-451c-a3c8-8c70c367c7e2"
  config_drive = true
  user_data    = file("cloud-init.yml")
  network {
    port = openstack_networking_port_v2.port_mgmt_backup02.id
  }
  network {
    port = openstack_networking_port_v2.port_backup_backup02.id
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

resource "openstack_compute_volume_attach_v2" "attach_01" {
  instance_id = openstack_compute_instance_v2.cloud_backup_01.id
  volume_id   = openstack_blockstorage_volume_v3.vol_1.id
}

resource "openstack_compute_volume_attach_v2" "attach_02" {
  instance_id = openstack_compute_instance_v2.cloud_backup_02.id
  volume_id   = openstack_blockstorage_volume_v3.vol_2.id
}


