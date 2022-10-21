output vpc_id {
  value = module.networking.vpc_id
}

output private_subnet_ids {
  value = var.create_private_subnet ? module.networking.private_subnet_ids : null
}

output public_subnet_ids {
  value = var.create_public_subnet ? module.networking.public_subnet_ids : null
}