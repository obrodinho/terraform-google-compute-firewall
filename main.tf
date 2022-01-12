resource "google_compute_firewall" "firewall" {
  name   		  			 = var.name
  network		  			 = var.network
	description 			 = var.description
	project		  			 = var.project
	direction					 = var.direction
	source_ranges 		 = var.source_ranges
	destination_ranges = var.destination_ranges

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

  source_tags = var.source_tags
  target_tags = var.target_tags
}