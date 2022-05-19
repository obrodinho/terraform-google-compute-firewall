resource "google_compute_firewall" "this" {
  name               = var.name
  network            = var.network
  description        = var.description == "" ? null : var.description
  project            = var.project
  direction          = var.direction
  source_ranges      = length(var.destination_ranges) != 0 || var.direction == "EGRESS" || length(var.source_ranges) == 0 ? null : var.source_ranges
  destination_ranges = length(var.source_ranges) != 0 || var.direction == "INGRESS" || length(var.destination_ranges) == 0 ? null : var.destination_ranges

  dynamic "allow" {
    for_each = var.allow
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }

  dynamic "deny" {
    for_each = var.deny
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }

  source_tags             = length(var.source_service_accounts) != 0 || var.direction == "EGRESS" || length(var.source_tags) == 0 ? null : var.source_tags
  target_tags             = length(var.target_service_accounts) != 0 || length(var.target_tags) == 0 ? null : var.target_tags
  source_service_accounts = length(var.source_tags) != 0 || length(var.source_service_accounts) == 0 ? null : var.source_service_accounts
  target_service_accounts = length(var.target_tags) != 0 || length(var.target_service_accounts) == 0 ? null : var.target_service_accounts

  dynamic "log_config" {
    for_each = toset(var.enable_logging ? ["iterate me"] : [])
    content {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }
}