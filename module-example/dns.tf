# see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/dns_zone
resource "yandex_dns_zone" "main" {
  name        = var.dns_zone_name
  description = "Terraform-managed Zone for ${var.compute_instance_name}"
  zone        = var.dns_zone_zone
  public      = true
}
