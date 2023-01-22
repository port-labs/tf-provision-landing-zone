# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
# module "sandbox_account_01" {
#   source = "./modules/aft-account-request"

#   control_tower_parameters = {
#     AccountEmail = "ACCOUNT_EMAIL_PH"
#     AccountName  = "ACCOUNT_NAME_PH"
#     # Syntax for top-level OU
#     ManagedOrganizationalUnit = "Sandbox"
#     # Syntax for nested OU
#     # ManagedOrganizationalUnit = "Sandbox (ou-xfe5-a8hb8ml8)"
#     SSOUserEmail     = "ACCOUNT_EMAIL_PH"
#     SSOUserFirstName = "SSO_FIRST_NAME_PH"
#     SSOUserLastName  = "SSO_LAST_NAME_PH"
#   }

#   account_tags = {
#     "ABC:Owner"       = "ACCOUNT_EMAIL_PH"
#     "ABC:Division"    = "ENT"
#     "ABC:Environment" = "Dev"
#     "ABC:CostCenter"  = "123456"
#     "ABC:Vended"      = "true"
#     "ABC:DivCode"     = "102"
#     "ABC:BUCode"      = "ABC003"
#     "ABC:Project"     = "123456"
#   }

#   change_management_parameters = {
#     change_requested_by = "SSO_FIRST_NAME_PH SSO_LAST_NAME_PH"
#     change_reason       = "testing the account vending process"
#   }

#   custom_fields = {
#     custom1 = "a"
#     custom2 = "b"
#   }

#   account_customizations_name = "sandbox-customizations"
# }

resource "mock_simple_resource" "simple-ACCOUNT_NAME_PH" {
  integer = 0
}

resource "port-labs_entity" "port-lz-provisioner-account-ACCOUNT_NAME_PH" {

  depends_on = [
    mock_simple_resource.simple-ACCOUNT_NAME_PH
  ]

  title      = "ACCOUNT_NAME_PH"
  blueprint  = "landingZone"
  identifier = "ACCOUNT_NAME_PH"
  properties {
    name  = "email"
    value = "ACCOUNT_EMAIL_PH"
  }
  properties {
    name  = "ssoUserFirstName"
    value = "SSO_FIRST_NAME_PH"
  }
  properties {
    name  = "ssoUserLastName"
    value = "SSO_LAST_NAME_PH"
  }
  properties {
    name  = "status"
    value = "Active"
  }
  properties {
    name  = "definitionFile"
    value = "FILE_URL_PH"
  }
}
