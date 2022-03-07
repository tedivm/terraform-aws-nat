
module "instance_profile" {
  source = "../ec2_iam_profile"
  name   = "${var.vpc.id}_NAT_Instance_Profile"
  tags   = local.common_tags
}
