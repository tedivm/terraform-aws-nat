
resource "aws_route" "route_to_nat" {
  count                  = var.max_availability_zones
  route_table_id         = var.route_tables[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  instance_id            = var.high_availability ? aws_instance.main[count.index].id : aws_instance.main[0].id
}
