# terraform-vcd-nsxt-alb-pool

Terraform module which manages NSX-T ALB pool ressources for consumption by NSX-T ALB loadbalancers on VMWare Cloud Director.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.9 |
| <a name="requirement_vcd"></a> [vcd](#requirement\_vcd) | >= 3.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vcd"></a> [vcd](#provider\_vcd) | 3.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vcd_nsxt_alb_pool.nsxt_alb_pool](https://registry.terraform.io/providers/vmware/vcd/latest/docs/resources/nsxt_alb_pool) | resource |
| [vcd_library_certificate.library_certificate](https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/library_certificate) | data source |
| [vcd_nsxt_edgegateway.nsxt_edgegateway](https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/nsxt_edgegateway) | data source |
| [vcd_nsxt_ip_set.nsxt_ip_set](https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/nsxt_ip_set) | data source |
| [vcd_vdc_group.vdc_group](https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/vdc_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vdc_edgegateway_name"></a> [vdc\_edgegateway\_name](#input\_vdc\_edgegateway\_name) | Edge Gateway of Customer. | `string` | n/a | yes |
| <a name="input_vdc_group_name"></a> [vdc\_group\_name](#input\_vdc\_group\_name) | Default Virtual Data Center Group of Customer. | `string` | n/a | yes |
| <a name="input_vdc_org_name"></a> [vdc\_org\_name](#input\_vdc\_org\_name) | The name of the organization to use. | `string` | n/a | yes |
| <a name="input_algorithm"></a> [algorithm](#input\_algorithm) | Optional algorithm for choosing pool members. | `string` | `"LEAST_CONNECTIONS"` | no |
| <a name="input_ca_certificate_name"></a> [ca\_certificate\_name](#input\_ca\_certificate\_name) | The alias of the certificate from the VCD library. | `string` | `""` | no |
| <a name="input_cn_check_enabled"></a> [cn\_check\_enabled](#input\_cn\_check\_enabled) | Specifies whether to check the common name of the certificate presented by the pool member | `bool` | `false` | no |
| <a name="input_default_port"></a> [default\_port](#input\_default\_port) | Default Port defines destination server port used by the traffic sent to the member. | `number` | `80` | no |
| <a name="input_description"></a> [description](#input\_description) | An optional description NSX-T ALB Pool. | `string` | `null` | no |
| <a name="input_domain_names"></a> [domain\_names](#input\_domain\_names) | A set of domain names which will be used to verify the common names or subject alternative names presented by the pool member certificates | `list(string)` | `[]` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Boolean value if NSX-T ALB Pool should be enabled. | `bool` | `true` | no |
| <a name="input_graceful_timeout_period"></a> [graceful\_timeout\_period](#input\_graceful\_timeout\_period) | Maximum time in minutes to gracefully disable pool member. | `string` | `"1"` | no |
| <a name="input_health_monitor"></a> [health\_monitor](#input\_health\_monitor) | A block to define health monitor | <pre>list(object({<br>    type = string<br>  }))</pre> | `[]` | no |
| <a name="input_member_group_ip_set_name"></a> [member\_group\_ip\_set\_name](#input\_member\_group\_ip\_set\_name) | The name of the Member Group IP Set. | `string` | `null` | no |
| <a name="input_members"></a> [members](#input\_members) | List of pool members. | <pre>list(object({<br>    enabled    = bool<br>    ip_address = string<br>    port       = number<br>    ratio      = number<br>  }))</pre> | `[]` | no |
| <a name="input_passive_monitoring_enabled"></a> [passive\_monitoring\_enabled](#input\_passive\_monitoring\_enabled) | defines if client traffic should be used to check if pool member is up or down. | `bool` | `true` | no |
| <a name="input_persistence_profile"></a> [persistence\_profile](#input\_persistence\_profile) | Persistence profile to ensure that the same user sticks to the same server for a desired duration of time | <pre>list(object({<br>    type  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_pool_name"></a> [pool\_name](#input\_pool\_name) | A name for NSX-T ALB Pool. | `string` | `null` | no |
| <a name="input_use_member_group"></a> [use\_member\_group](#input\_use\_member\_group) | Whether to use an IP set as pool members. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_associated_virtual_service_ids"></a> [associated\_virtual\_service\_ids](#output\_associated\_virtual\_service\_ids) | Virtual services IDs for this pool. |
| <a name="output_associated_virtual_services"></a> [associated\_virtual\_services](#output\_associated\_virtual\_services) | Virtual services for this pool. |
| <a name="output_health_message"></a> [health\_message](#output\_health\_message) | Current health status. |
| <a name="output_lb_algorithm"></a> [lb\_algorithm](#output\_lb\_algorithm) | Distribution algorithm. |
| <a name="output_lb_default_server_port"></a> [lb\_default\_server\_port](#output\_lb\_default\_server\_port) | Default server port. |
| <a name="output_lb_enabled_member_count"></a> [lb\_enabled\_member\_count](#output\_lb\_enabled\_member\_count) | Enabled pool member count. |
| <a name="output_lb_health_monitor_name"></a> [lb\_health\_monitor\_name](#output\_lb\_health\_monitor\_name) | System generated name of Health monitor. |
| <a name="output_lb_health_monitor_system_defined"></a> [lb\_health\_monitor\_system\_defined](#output\_lb\_health\_monitor\_system\_defined) | A boolean flag if the Health monitor is system defined. |
| <a name="output_lb_health_monitor_type"></a> [lb\_health\_monitor\_type](#output\_lb\_health\_monitor\_type) | Type of health monitor. One of HTTP, HTTPS, TCP, UDP, PING. |
| <a name="output_lb_member_count"></a> [lb\_member\_count](#output\_lb\_member\_count) | Pool member count. |
| <a name="output_lb_member_group_ipset_name"></a> [lb\_member\_group\_ipset\_name](#output\_lb\_member\_group\_ipset\_name) | This pools used ip\_set name. |
| <a name="output_lb_persistence_profile_name"></a> [lb\_persistence\_profile\_name](#output\_lb\_persistence\_profile\_name) | System generated name of Persistence Profile. |
| <a name="output_lb_pool_members"></a> [lb\_pool\_members](#output\_lb\_pool\_members) | List of all members with their details. |
| <a name="output_lb_up_member_count"></a> [lb\_up\_member\_count](#output\_lb\_up\_member\_count) | Pool member up count. |
<!-- END_TF_DOCS -->

## Examples

```
module "webserver_lb_pool" {
  source                   = "git::https://github.com/noris-network/terraform-vcd-nsxt-alb-pool?ref=1.0.0"
  vdc_group_name           = "myDCGroup"
  vdc_org_name             = "myORG"
  vdc_edgegateway_name     = "T1-myORG"
  pool_name                = "webserver_alb_pool"
  default_port             = 443
  use_member_group         = true
  member_group_ip_set_name = "webserver_ip_set"
  health_monitor           = ["HTTP"]
}
```
