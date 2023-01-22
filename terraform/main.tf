locals {
  name = "port-lz-provisioner"
  standard_tags = {
    "environment" = "port-lz-provisioner"
    "createdBy"   = "Terraform"
  }
  region = "eu-west-1"
}

resource "aws_iam_user" "port-lz-provisioner-user" {
  name = "port-lz-provisioner-user"
  path = "/demo/"

  force_destroy = true

  tags = merge(
    local.standard_tags, {
      "Name" = "${local.name}-user"
  }, )
}

resource "aws_iam_user_policy_attachment" "attach_admin_policy" {
  user       = aws_iam_user.port-lz-provisioner-user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "port-lz-provisioner-user" {
  user = aws_iam_user.port-lz-provisioner-user.name
}
