# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
# module "sandbox_account_01" {
#   source = "./modules/aft-account-request"

#   control_tower_parameters = {
#     AccountEmail = "morp@getport.io"
#     AccountName  = "morp"
#     # Syntax for top-level OU
#     ManagedOrganizationalUnit = "Sandbox"
#     # Syntax for nested OU
#     # ManagedOrganizationalUnit = "Sandbox (ou-xfe5-a8hb8ml8)"
#     SSOUserEmail     = "morp@getport.io"
#     SSOUserFirstName = "mor"
#     SSOUserLastName  = "p"
#   }

#   account_tags = {
#     "ABC:Owner"       = "morp@getport.io"
#     "ABC:Division"    = "ENT"
#     "ABC:Environment" = "Dev"
#     "ABC:CostCenter"  = "123456"
#     "ABC:Vended"      = "true"
#     "ABC:DivCode"     = "102"
#     "ABC:BUCode"      = "ABC003"
#     "ABC:Project"     = "123456"
#   }

#   change_management_parameters = {
#     change_requested_by = "mor p"
#     change_reason       = "testing the account vending process"
#   }

#   custom_fields = {
#     custom1 = "a"
#     custom2 = "b"
#   }

#   account_customizations_name = "sandbox-customizations"
# }

resource "mock_simple_resource" "simple-morp" {
  integer = 0
}

resource "port-labs_entity" "port-lz-provisioner-account-morp" {

  depends_on = [
    mock_simple_resource.simple-morp
  ]

  title      = "morp"
  blueprint  = "landingZone"
  identifier = "morp"
  properties {
    name  = "email"
    value = "morp@getport.io"
  }
  properties {
    name  = "ssoUserFirstName"
    value = "mor"
  }
  properties {
    name  = "ssoUserLastName"
    value = "p"
  }
  properties {
    name  = "status"
    value = "Active"
  }
  properties {
    name  = "definitionFile"
    value = "https://github.com/port-labs/tf-provision-landing-zone/blob/main/terraform/morp.tf"
  }
}
