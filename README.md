# Building Infrastructure You Can (Mostly) Trust

> Companion Repository for [DevOops 2021](https://devoops.ru/en/talks/building-trustable-infrastructure/).

## Table of Contents

- [Enhancing Infrastructure Lifecycles](#building-infrastructure-you-can-mostly-trust)
  - [Table of Contents](#table-of-contents)
  - [Important Links](#important-links)
  - [Requirements](#requirements)
  - [Usage](#usage)
    - [Inputs](#inputs)
    - [Outputs](#outputs)
  - [Author Information](#author-information)
  - [License](#license)

## Important Links

* Slides: [speakerdeck.com/ksatirli/building-infrastructure-you-can-mostly-trust](https://speakerdeck.com/ksatirli/building-infrastructure-you-can-mostly-trust)
* Code: [https://github.com/ksatirli/building-infrastructure-you-can-mostly-trust](https://github.com/ksatirli/building-infrastructure-you-can-mostly-trust)

## Requirements

* Software
  * [HashiCorp Terraform](https://www.terraform.io/downloads.html) `1.0.9` or later
  * [Yandex.Cloud Command-Line Interface](https://cloud.yandex.com/en/docs/cli/quickstart) `0.83.0` or later
  * [terraform-docs](https://terraform-docs.io) `0.16.0` or later

* Services
  * [Yandex.Cloud](https://cloud.yandex.com/) (free credit)

## Usage

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| yandex\_cloud\_id | The ID of the cloud to apply any resources to. | `string` | n/a | yes |
| yandex\_folder\_id | The ID of the folder to operate under, if not specified by a given resource. | `string` | n/a | yes |
| yandex\_token | Security token or IAM token used for authentication in Yandex.Cloud. | `string` | n/a | yes |
| yandex\_zone | The default availability zone to operate under, if not specified by a given resource. | `string` | n/a | yes |

### Outputs

No outputs.
<!-- END_TF_DOCS -->

## Author Information

This repository is maintained by the contributors listed on [GitHub](https://github.com/ksatirli/building-infrastructure-you-can-mostly-trust/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
