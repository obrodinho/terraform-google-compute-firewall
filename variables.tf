//required
variable "name" {
  type = string
  description = "Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035."
}

variable "description" {
  type = string
  description = "An optional description of this resource. Provide this property when you create the resource."
	default = ""
}

variable "network" {
  type = string
  description = "The name or self_link of the network to attach this firewall to."
}

//optional
variable "project" {
  type = string
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}

variable "direction" {
  type = string
  description = "Direction of traffic to which this firewall applies; default is INGRESS. Note: For INGRESS traffic, it is NOT supported to specify destinationRanges; For EGRESS traffic, it is NOT supported to specify source_ranges OR source_tags. For INGRESS traffic, one of source_ranges, source_tags or source_service_accounts is required. Possible values are INGRESS and EGRESS."
}

variable "source_ranges" {
	type = list(string)
	description = "If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges. These ranges must be expressed in CIDR format."
	default = []
}

variable "destination_ranges" {
	type = list(string)
	description = "If destination ranges are specified, the firewall will apply only to traffic that has destination IP address in these ranges. These ranges must be expressed in CIDR format."
	default = []
}

variable "source_tags" {
	type = list(string)
	description = "If destination ranges are specified, the firewall will apply only to traffic that has destination IP address in these ranges. These ranges must be expressed in CIDR format."
	default = []
}

variable "target_tags" {
	type = list(string)
	description = "If destination ranges are specified, the firewall will apply only to traffic that has destination IP address in these ranges. These ranges must be expressed in CIDR format."
	default = []
}

variable "source_service_accounts" {
	type = list(string)
	description = "If source service accounts are specified, the firewall will apply only to traffic originating from an instance with a service account in this list."
	default = []
}

variable "target_service_accounts" {
	type = list(string)
	description = "A list of service accounts indicating sets of instances located in the network that may make network connections as specified in allowed[]. targetServiceAccounts cannot be used at the same time as targetTags or sourceTags."
	default = []
}

variable "allow" {
  description = "The list of ALLOW rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a permitted connection."
  type = list(object({
      protocol = string
      ports = list(string)
  }))
	default = []
}

variable "deny" {
  description = "The list of DENY rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a denied connection."
  type = list(object({
      protocol = string
      ports = list(string)
  }))
	default = []
}

