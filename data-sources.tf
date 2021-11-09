# this data source is unused; it is left here to trigger tflint
# see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/datasource_vpc_network
data "yandex_vpc_network" "default" {
  name      = "default"
  folder_id = var.yandex_folder_id
}

data "yandex_vpc_subnet" "default" {
  name = "default-${var.yandex_zone}"
}

# see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/datasource_compute_image
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}
