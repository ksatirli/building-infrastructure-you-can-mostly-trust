# see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance
resource "yandex_compute_instance" "exposition" {
  name        = "vdnkh-1"
  platform_id = "standard-v1"
  zone        = var.yandex_zone

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    # Defines whether the disk will be auto-deleted when the instance is deleted.
    #
    # Although `true` is currently the default value, we specify it to
    # ensure that any provider changes do not affect us at a later point.
    auto_delete = true

    # see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance#initialize_params
    initialize_params {
      # dynamic reference to the Image ID retrieved from the `yandex_compute_image` data source
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.default.id
  }
}
