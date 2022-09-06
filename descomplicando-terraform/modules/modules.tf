module "servers" {
  source = "./servers"
  #version = 
  #provider = 
  servers = 2
}

output "ip_address"{
    value = module.servers.ip_address
}

#Exemplo:
# resource "aws_route53_record" "server" {
#   zone_id = aws_route53_zone.primary.zone_id
#   name    = "server"
#   type    = "A"
#   ttl     = 300
#   records = [module.servers.ip_address[0]]
# }
