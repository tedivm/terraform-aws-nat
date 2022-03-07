
output "aws_instances" {
  value = aws_instance.main
}

output "aws_security_group" {
  value = aws_security_group.nat_traffic
}

output "aws_iam_role" {
  value = module.instance_profile.aws_iam_role
}

output "aws_eip" {
  value = aws_eip.main
}
