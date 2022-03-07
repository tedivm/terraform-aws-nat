
resource "aws_security_group" "nat_traffic" {
  name        = "${var.vpc.id} NAT Traffic"
  description = "Allow internal VPC traffic and all outbound traffic"
  vpc_id      = var.vpc.id

  ingress {
    description = "All traffic from inside VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}
