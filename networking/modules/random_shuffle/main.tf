resource "random_shuffle" "az" {
  input        = var.input
  result_count = "${length(var.subnetList)}"
}