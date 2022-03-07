
resource "aws_eip" "main" {
  count    = var.high_availability ? local.nat_count : 0
  instance = aws_instance.main[count.index].id
  vpc      = true
  tags     = local.common_tags
}
