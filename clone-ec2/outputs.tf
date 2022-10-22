output AMIs {
  value = tomap({
    for ami in module.cloneAMI.AMIs: ami.tag["Name"] => ami.id
  })
}