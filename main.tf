resource "google_compute_firewall" "firewall" {
  name   		  			 = var.name
  network		  			 = var.network
	description 			 = var.description == "" ? null : var.description
	project		  			 = var.project
	direction					 = var.direction
	source_ranges 		 = direction == "EGRESS" || var.source_ranges == [] ? null : var.source_ranges
	destination_ranges = direction == "INGRESS" || var.destination_ranges == [] ? null : var.destination_ranges

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

  source_tags = direction == "EGRESS" || var.source_tags == [] ? null : var.source_tags
  target_tags = direction == "INGRESS" || var.target_tags == [] ? null : var.target_tags
	source_service_accounts = direction == "EGRESS" || var.source_service_accounts == [] ? null : var.source_service_accounts
	target_service_accounts = direction == "INGRESS" || var.target_service_accounts == [] ? null : var.target_service_accounts
}