terraform {
  required_version = ">= 1.1.7"
  experiments      = [module_variable_optional_attrs]
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.21.0"
    }
  }
}
