# see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs#cloud_id
variable "yandex_cloud_id" {
  type        = string
  description = "The ID of the cloud to apply any resources to."
}

# see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs#folder_id
variable "yandex_folder_id" {
  type        = string
  description = "The ID of the folder to operate under, if not specified by a given resource."
}

# see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs#token
variable "yandex_token" {
  type = string

  # see https://www.terraform.io/docs/language/values/variables.html#suppressing-values-in-cli-output
  sensitive   = true
  description = "Security token or IAM token used for authentication in Yandex.Cloud."
}

# see https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs#zone
variable "yandex_zone" {
  type        = string
  description = "The default availability zone to operate under, if not specified by a given resource."

  # see https://www.terraform.io/docs/language/values/variables.html#custom-validation-rules
  validation {
    # valid zones include `ru-central1-a`, `ru-central1-b`, and `ru-central1-c`,
    # but we are omitting `ru-central1-b` for operational reasons, see <link to wiki>
    condition     = contains(["ru-central1-a", "ru-central1-c"], var.yandex_zone)
    error_message = "The value for `yandez_zone` must be one of `ru-central1-a` or `ru-central1-c`."
  }
}
