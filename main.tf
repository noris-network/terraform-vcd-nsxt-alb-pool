data "vcd_vdc_group" "vdc_group" {
  name = var.vdc_group_name
}

data "vcd_nsxt_edgegateway" "nsxt_edgegateway" {
  org      = var.vdc_org_name
  owner_id = data.vcd_vdc_group.vdc_group.id
  name     = var.vdc_edgegateway_name
}

data "vcd_library_certificate" "library_certificate" {
  for_each = var.ca_certificate_name != "" ? { ca_cert = var.ca_certificate_name } : {} # TODO, should be null not empty string
  alias    = each.value
}

data "vcd_nsxt_ip_set" "nsxt_ip_set" {
  for_each        = var.member_group_ip_set_name != "" ? { ip_set = var.member_group_ip_set_name } : {}
  org             = var.vdc_org_name
  edge_gateway_id = data.vcd_nsxt_edgegateway.nsxt_edgegateway.id
  name            = each.value
}

resource "vcd_nsxt_alb_pool" "nsxt_alb_pool" {
  org                        = var.vdc_org_name
  name                       = var.pool_name
  edge_gateway_id            = data.vcd_nsxt_edgegateway.nsxt_edgegateway.id
  description                = var.description
  enabled                    = var.enabled
  algorithm                  = var.algorithm
  default_port               = var.default_port
  graceful_timeout_period    = var.graceful_timeout_period
  passive_monitoring_enabled = var.passive_monitoring_enabled
  ssl_enabled                = var.ssl_enabled
  ca_certificate_ids         = var.ca_certificate_name != "" ? [data.vcd_library_certificate.library_certificate["ca_cert"].id] : []
  cn_check_enabled           = var.cn_check_enabled
  domain_names               = var.domain_names

  dynamic "persistence_profile" {
    for_each = var.persistence_profile
    content {
      type  = persistence_profile.value.type
      value = persistence_profile.value.type == "HTTP_COOKIE" || persistence_profile.value.type == "CUSTOM_HTTP_HEADER" || persistence_profile.value.type == "APP_COOKIE" ? persistence_profile.value.value : ""
    }
  }

  dynamic "health_monitor" {
    for_each = var.health_monitor
    content {
      type = health_monitor.value.type
    }
  }

  dynamic "member" {
    for_each = var.use_member_group ? [] : var.members
    content {
      enabled    = member.value.enabled
      ip_address = member.value.ip_address
      port       = member.value.port
      ratio      = member.value.ratio
    }
  }

  member_group_id = var.use_member_group ? data.vcd_nsxt_ip_set.nsxt_ip_set["ip_set"].id : null

  lifecycle {
    create_before_destroy = true
  }
}
