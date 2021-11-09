output "console_compute_instances_overview" {
  description = "Console URL for Compute Instances Overview."
  value       = "https://console.cloud.yandex.com/folders/${var.yandex_folder_id}/compute?section=instances"
}

output "console_compute_instance_exposition" {
  description = "Console URL for `exposition` Compute Instance."
  value       = "https://console.cloud.yandex.com/folders/${var.yandex_folder_id}/compute/instance/${yandex_compute_instance.exposition.id}?section=overview"
}
