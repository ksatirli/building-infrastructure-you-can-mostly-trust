terraform {
  # see https://www.terraform.io/docs/language/settings/index.html#specifying-provider-requirements
  required_providers {
    # define the source and version of the provider
    # see https://registry.terraform.io/providers/yandex-cloud/yandex/0.66.0
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.66.0"
    }
  }

  # define the exact version of Terraform to use
  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = "1.0.10"
}
