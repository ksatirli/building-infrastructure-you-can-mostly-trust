# see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_disk
resource "yandex_compute_disk" "os_disk" {
  name     = "os"
  type     = "network-ssd"
  zone     = var.yandex_zone
  image_id = "ubuntu-20.04"
}

# see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_disk
resource "yandex_compute_disk" "data_disk" {
  name     = "data"
  type     = "network-ssd"
  zone     = var.yandex_zone
  image_id = "ubuntu-20.04"
}

# see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance
resource "yandex_compute_instance" "main" {
  name        = var.compute_instance_name
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
      image_id = yandex_compute_disk.os_disk.image_id
    }
  }

  # see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance#secondary_disk
  secondary_disk {
    auto_delete = false
    device_name = "/dev/xvdb"
    disk_id     = yandex_compute_disk.data_disk.id
    mode        = "READ_WRITE"
  }

  # see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance#network_interface
  network_interface {
    subnet_id = data.yandex_vpc_subnet.default.id

    # see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance#fqdn
    dns_record {
      fqdn        = "${var.dns_zone_name}.${yandex_dns_zone.main.zone}"
      dns_zone_id = yandex_dns_zone.main.id
    }
  }
}
