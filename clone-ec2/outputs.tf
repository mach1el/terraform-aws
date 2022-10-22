output AMIs {
  value = tomap({
    for ami in module.cloneAMI.AMIs: ami.tags["Name"] => ami.id
  })
}