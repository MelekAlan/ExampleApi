terraform {
  required_version = "> 0.14.0"
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = ">=0.19.0"
    }

    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.47.0"
    }
  }
}
