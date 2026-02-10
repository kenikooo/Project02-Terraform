resource "openstack_networking_secgroup_v2" "icmp" {
  name = "icmp"
}
resource "openstack_networking_secgroup_rule_v2" "icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.icmp.id
}

resource "openstack_networking_secgroup_v2" "ssh" {
  name = "ssh"
}

