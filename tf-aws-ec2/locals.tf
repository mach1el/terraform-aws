locals {
  serverconfig = [
    for srv in var.configuration : [
      for i in range(1) : {
        ami             = srv.ami
        instance_name   = srv.service_name
        instance_type   = srv.instance_type
        subnet_id       = srv.subnet_id
        ssh_key_name    = srv.ssh_key_name
        security_groups = srv.vpc_security_group_ids
        volume_size     = srv.volume_size
        volume_type     = srv.volume_type
        system_name     = srv.system_name
      }
    ]
  ]
}

locals {
  instances = flatten(local.serverconfig)
}