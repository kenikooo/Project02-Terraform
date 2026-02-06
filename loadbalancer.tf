# Группы безопасности
resource "openstack_networking_secgroup_v2" "sg_lb" {
  name = "SG-Load-Balancer"
}
resource "openstack_networking_secgroup_rule_v2" "rule_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.sg_lb.id
}
resource "openstack_networking_secgroup_rule_v2" "rule_https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.sg_lb.id
}
# Балансировщик + привязка к SG
resource "openstack_lb_loadbalancer_v2" "lb_ha" {
  name               = "Load Balancer"
  vip_address        = "172.16.1.1"
  vip_subnet_id      = openstack_networking_subnet_v2.subnet_external.id
  security_group_ids = [openstack_networking_secgroup_v2.sg_lb.id]
}

# Листенер
resource "openstack_lb_listener_v2" "listener_http" {
  name            = "Listener-HTTP"
  protocol        = "HTTP"
  protocol_port   = 80
  loadbalancer_id = openstack_lb_loadbalancer_v2.lb_ha.id
}
resource "openstack_lb_pool_v2" "pool_http" {
  name        = "Pool_HTTP"
  protocol    = "HTTP"
  lb_method   = "ROUND_ROBIN"
  listener_id = openstack_lb_listener_v2.listener_http.id
}
# Листенер
resource "openstack_lb_listener_v2" "listener_https" {
  name            = "Listener-HTTPS"
  protocol        = "TCP"
  protocol_port   = 443
  loadbalancer_id = openstack_lb_loadbalancer_v2.lb_ha.id
}
resource "openstack_lb_pool_v2" "pool_https" {
  name        = "Pool_HTTPS"
  protocol    = "TCP"
  lb_method   = "ROUND_ROBIN"
  listener_id = openstack_lb_listener_v2.listener_https.id
}

resource "openstack_lb_member_v2" "cloud-ha01-http" {
  pool_id       = openstack_lb_pool_v2.pool_http.id
  address       = "172.16.1.2"
  protocol_port = 80
  subnet_id     = openstack_networking_subnet_v2.subnet_external.id
}

resource "openstack_lb_member_v2" "cloud-ha02-http" {
  pool_id       = openstack_lb_pool_v2.pool_http.id
  address       = "172.16.1.3"
  protocol_port = 80
  subnet_id     = openstack_networking_subnet_v2.subnet_external.id
}
