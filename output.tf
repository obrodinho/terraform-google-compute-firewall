output "public_ip" {
  description = "The internet facing public ip for the compute incstance"
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

output "compute_instance_serviceaccount" {
  description = "The email/name of the compute instance service account"
  value       = google_service_account.default.email
}