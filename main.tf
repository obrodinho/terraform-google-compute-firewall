resource "google_compute_firewall" "firewall" {
  name   		  			 = var.name
  network		  			 = var.network
	description 			 = var.description == "" ? null : var.description
	project		  			 = var.project
	direction					 = var.direction
	source_ranges 		 = var.destination_ranges != [] || var.direction == "EGRESS" || var.source_ranges == [] ? null : var.source_ranges
	destination_ranges = var.source_ranges != [] || var.direction == "INGRESS" || var.destination_ranges == [] ? null : var.destination_ranges

  dynamic "allow" {
		for_each = var.allow
		content {
			protocol = allow.value.protocol
			ports		 = allow.value.ports
		}
  }

	dynamic "deny" {
		for_each = var.deny
		content {
			protocol = allow.value.protocol
			ports		 = allow.value.ports
		}
  }

  source_tags = var.source_service_accounts != [] || var.direction == "EGRESS" || var.source_tags == [] ? null : var.source_tags
  target_tags = var.target_service_accounts != [] || var.target_tags == [] ? null : var.target_tags
	source_service_accounts = var.source_tags != [] || var.source_service_accounts == [] ? null : var.source_service_accounts
	target_service_accounts = var.target_tags != [] || var.target_service_accounts == [] ? null : var.target_service_accounts
}