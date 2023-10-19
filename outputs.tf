output "associated_virtual_service_ids" {
  value       = vcd_nsxt_alb_pool.nsxt_alb_pool.associated_virtual_service_ids
  description = "Virtual services IDs for this pool."
}

output "associated_virtual_services" {
  value       = vcd_nsxt_alb_pool.nsxt_alb_pool.associated_virtual_services
  description = "Virtual services for this pool."
}

output "lb_pool_members" {
  value = [for member in vcd_nsxt_alb_pool.nsxt_alb_pool.member : {
    enabled    = member.enabled
    ip_address = member.ip_address
    port       = member.port
    ratio      = member.ratio
  }]
  description = "List of all members with their details."
}

output "lb_member_count" {
  value       = vcd_nsxt_alb_pool.nsxt_alb_pool.member_count
  description = "Pool member count."
}

output "lb_up_member_count" {
  value       = vcd_nsxt_alb_pool.nsxt_alb_pool.up_member_count
  description = "Pool member up count."
}

output "lb_enabled_member_count" {
  value       = vcd_nsxt_alb_pool.nsxt_alb_pool.enabled_member_count
  description = "Enabled pool member count."
}

output "health_message" {
  value       = vcd_nsxt_alb_pool.nsxt_alb_pool.health_message
  description = "Current health status."
}

output "lb_algorithm" {
  value       = var.algorithm
  description = "Distribution algorithm."
}

output "lb_default_server_port" {
  value       = var.default_port
  description = "Default server port."
}

output "lb_persistence_profile_name" {
  value       = try(vcd_nsxt_alb_pool.nsxt_alb_pool.persistence_profile[0].name, null)
  description = "System generated name of Persistence Profile."
}

output "lb_health_monitor_type" {
  value       = try(vcd_nsxt_alb_pool.nsxt_alb_pool.health_monitor[*].type, null)
  description = "Type of health monitor. One of HTTP, HTTPS, TCP, UDP, PING."
}

output "lb_health_monitor_name" {
  value       = try(vcd_nsxt_alb_pool.nsxt_alb_pool.health_monitor[*].name, null)
  description = "System generated name of Health monitor."
}

output "lb_health_monitor_system_defined" {
  value       = try(vcd_nsxt_alb_pool.nsxt_alb_pool.health_monitor[*].system_defined, null)
  description = "A boolean flag if the Health monitor is system defined."
}

output "lb_member_group_ipset_name" {
  value       = var.member_group_ip_set_name
  description = "This pools used ip_set name."
}
