module "servers" {
  source  = "./server"
  servers = 2
}

output "ip_address" {
  value = module.servers.ip_address
}
