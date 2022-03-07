# Teraform AWS NAT Module

This module launches a NAT Instance to enable internet traffic in a private subnet.

## Usage

### Example

```terraform
module "nat" {
  source  = "tedivm/nat/aws"
  version = "~> 1.0"

  vpc                    = aws_vpc.main
  max_availability_zones = var.max_availability_zones
  route_tables           = aws_route_table.private
  subnets                = aws_subnet.public
  high_availability      = var.high_availability_nat
  tags = local.common_tags
}
```

### Outputs

* aws_instances
* aws_security_group
* aws_iam_role
* aws_eip

## High Availability Mode

In High Availability Mode this module runs one NAT in each availability zone. This ensures that issues in one zone do not affect the services in others. High Availability Mode also assigns each NAT Instance an Elastic IP address speed up the transfer of network connections to replacement instances.


## Resources Affected

* EC2 Instance
* EIP (if high availability mode is set)
* IAM Role (through the ec2_iam_profile module)
* Routes
* Security Group
