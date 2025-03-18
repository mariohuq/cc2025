output "servers" {
  value = {
    serverip = openstack_compute_instance_v2.tg_bot.access_ip_v4
  }
}