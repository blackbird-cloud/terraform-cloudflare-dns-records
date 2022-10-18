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

variable "zone_name" {
  description = "(Optional) The DNS zone name to add the records to. Must be specified as zone_id on the records, or on this variable."
  type        = string
  default     = ""
}
