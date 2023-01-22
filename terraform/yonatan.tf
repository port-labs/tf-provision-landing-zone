# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
# module "sandbox_account_01" {
#   source = "./modules/aft-account-request"

#   control_tower_parameters = {
#     AccountEmail = "bogu@getport.io"
#     AccountName  = "yonatan"
#     # Syntax for top-level OU
#     ManagedOrganizationalUnit = "Sandbox"
#     # Syntax for nested OU
#     # ManagedOrganizationalUnit = "Sandbox (ou-xfe5-a8hb8ml8)"
#     SSOUserEmail     = "bogu@getport.io"
#     SSOUserFirstName = "yonatan"
#     SSOUserLastName  = "bogu"
#   }

#   account_tags = {
#     "ABC:Owner"       = "bogu@getport.io"
#     "ABC:Division"    = "ENT"
#     "ABC:Environment" = "Dev"
#     "ABC:CostCenter"  = "123456"
#     "ABC:Vended"      = "true"
#     "ABC:DivCode"     = "102"
#     "ABC:BUCode"      = "ABC003"
#     "ABC:Project"     = "123456"
#   }

#   change_management_parameters = {
#     change_requested_by = "yonatan bogu"
#     change_reason       = "testing the account vending process"
#   }

#   custom_fields = {
#     custom1 = "a"
#     custom2 = "b"
#   }

#   account_customizations_name = "sandbox-customizations"
# }

resource "mock_simple_resource" "simple-yonatan" {
  integer = 0
}

resource "port-labs_entity" "port-lz-provisioner-account-yonatan" {

  depends_on = [
    mock_simple_resource.simple-yonatan
  ]

  title      = "yonatan"
  blueprint  = "landingZone"
  identifier = "yonatan"
  properties {
    name  = "email"
    value = "bogu@getport.io"
  }
  properties {
    name  = "ssoUserFirstName"
    value = "yonatan"
  }
  properties {
    name  = "ssoUserLastName"
    value = "bogu"
  }
  properties {
    name  = "status"
    value = "Active"
  }
  properties {
    name  = "definitionFile"
    value = "https://github.com/port-labs/tf-provision-landing-zone/blob/main/terraform/yonatan.tf"
  }
}
