data "cloudflare_zone" "this" {
  count = var.zone_name != "" ? 1 : 0
  name  = var.zone_name
}

resource "cloudflare_record" "records" {
  for_each = { for record in var.records : record.name => record }

  zone_id         = try(each.value.zone_id, data.cloudflare_zone.this[0].id)
  name            = each.value.name
  value           = each.value.value
  type            = each.value.type
  ttl             = try(each.value.ttl, 300)
  priority        = try(each.value.priority, null)
  proxied         = try(each.value.priority, false)
  allow_overwrite = var.allow_overwrite
}
