output "folder_id" {
  description = "Folder ID."
  value       = var.yandex_folder_id
}

output "instance_id" {
  description = "Instance ID."
  value       = yandex_compute_instance.main.id
}
