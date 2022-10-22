output AMIs {
  value = tolist(aws_ami_from_instance.clone)
}
