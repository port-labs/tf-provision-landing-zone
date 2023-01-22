# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
# module "sandbox_account_01" {
#   source = "./modules/aft-account-request"

#   control_tower_parameters = {
#     AccountEmail = "test@getport.io"
#     AccountName  = "test-perms"
#     # Syntax for top-level OU
#     ManagedOrganizationalUnit = "Sandbox"
#     # Syntax for nested OU
#     # ManagedOrganizationalUnit = "Sandbox (ou-xfe5-a8hb8ml8)"
#     SSOUserEmail     = "test@getport.io"
#     SSOUserFirstName = "test"
#     SSOUserLastName  = "permissions"
#   }

#   account_tags = {
#     "ABC:Owner"       = "test@getport.io"
#     "ABC:Division"    = "ENT"
#     "ABC:Environment" = "Dev"
#     "ABC:CostCenter"  = "123456"
#     "ABC:Vended"      = "true"
#     "ABC:DivCode"     = "102"
#     "ABC:BUCode"      = "ABC003"
#     "ABC:Project"     = "123456"
#   }

#   change_management_parameters = {
#     change_requested_by = "test permissions"
#     change_reason       = "testing the account vending process"
#   }

#   custom_fields = {
#     custom1 = "a"
#     custom2 = "b"
#   }

#   account_customizations_name = "sandbox-customizations"
# }

resource "mock_simple_resource" "simple-test-perms" {
  integer = 0
}

resource "port-labs_entity" "port-lz-provisioner-account-test-perms" {

  depends_on = [
    mock_simple_resource.simple-test-perms
  ]

  title      = "test-perms"
  blueprint  = "landingZone"
  identifier = "test-perms"
  properties {
    name  = "email"
    value = "test@getport.io"
  }
  properties {
    name  = "ssoUserFirstName"
    value = "test"
  }
  properties {
    name  = "ssoUserLastName"
    value = "permissions"
  }
  properties {
    name  = "status"
    value = "Active"
  }
  properties {
    name  = "definitionFile"
    value = "https://github.com/port-labs/tf-provision-landing-zone/blob/main/terraform/test-perms.tf"
  }
}
