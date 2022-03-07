
locals {
  nat_count = var.high_availability ? var.max_availability_zones : 1
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "main" {
  count         = local.nat_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  monitoring        = true
  source_dest_check = false
  subnet_id         = var.subnets[count.index].id

  iam_instance_profile   = module.instance_profile.aws_iam_instance_profile.name
  vpc_security_group_ids = [aws_security_group.nat_traffic.id]

  user_data = templatefile("${path.module}/templates/userdata.tmpl", { "VPC_CIDR" : var.vpc.cidr_block })

  tags = local.common_tags
}
