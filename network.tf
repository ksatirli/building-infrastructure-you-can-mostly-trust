# actual network configuration is handled through
# pre-generated network resources; you can find
# the lookups for the resources in `data-sources.tf`

# see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet
#resource "yandex_vpc_subnet" "exposition" {
#  folder_id  = var.yandex_folder_id
#  name       = "exposition"
#  network_id = data.yandex_vpc_network.default.id
#
#  v4_cidr_blocks = [
#    "10.10.0.0/24"
#  ]
#
#  zone = var.yandex_zone
#}
