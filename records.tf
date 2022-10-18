locals {
  recordsets = { for rs in local.records : try(rs.key, join(" ", compact(["${rs.name} ${rs.type}", try(rs.set_identifier, "")]))) => rs }
}

resource "cloudflare_record" "records" {
  for_each = { for k, v in local.recordsets : k => v }

  zone_id         = try(each.value.zone_id, var.cloudflare_zone_id)
  name            = each.value.name
  value           = each.value.value
  type            = each.value.type
  ttl             = try(each.value.ttl, 300)
  priority        = try(each.value.priority, null)
  proxied         = try(each.value.priority, false)
  allow_overwrite = var.allow_overwrite
}
