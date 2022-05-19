output "id" {
  description = "An identifier for the resource with format `projects/{{project}}/global/firewalls/{{name}}`"
  value       = google_compute_firewall.this.id
}