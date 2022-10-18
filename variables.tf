variable "records" {
  description = "List of objects of DNS records"
  type        = any
  default     = []
}

variable "allow_overwrite" {
  type        = bool
  default     = false
  description = " (Optional) Allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual changes outside Terraform from overwriting this record. false by default. This configuration is not recommended for most environments."
}

variable "cloudflare_zone_id" {
  description = "(Optional) The DNS zone ID to add the records to. Must be specified on the records, or on this variable."
  type        = string
}
