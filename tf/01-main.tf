terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.39.0"
    }
  }
}


# use environment variables
provider "openstack" {
  auth_url = "https://cloud.crplab.ru:5000"
  tenant_id = "a02aed7892fa45d0bc2bef3b8a08a6e9"
  tenant_name = "students"
  user_domain_name = "Default"
  # export TF_VAR_user_name=
  user_name = var.user_name
  # export TF_VAR_password=
  password = var.password
  region = "RegionOne"
}

resource "openstack_networking_secgroup_v2" "sg" {
  name = "mhq-group"
}

resource "openstack_networking_secgroup_rule_v2" "sg_ssh_rule" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 22
  port_range_max = 22
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.sg.id
}

resource "openstack_compute_instance_v2" "mhq_server" {
  name = "mhq-server"
  image_name = var.image_name
  flavor_name = var.server_flavor
  key_pair = var.key_pair
  security_groups = [openstack_networking_secgroup_v2.sg.name]

  network {
    name = var.network_name
  }
}

# https://github.com/diodonfrost/terraform-openstack-examples
