variable "port_client_id" {}

variable "port_client_secret" {}

terraform {
  required_providers {
    port-labs = {
      source  = "port-labs/port-labs"
      version = "~> 0.5.1"
    }
  }
}

provider "port-labs" {
  client_id = var.port_client_id     # or set the env var PORT_CLIENT_ID
  secret    = var.port_client_secret # or set the env var PORT_CLIENT_SECRET
}
