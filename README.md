<!-- OTC-HEADER-START -->

# otc-code/otc-res-common

<p align=right>⚙ 07.04.2023</p>
<details>
<summary>Table of contents</summary>

-   [Terraform Docs](#terraform-docs)
    -   [Requirements](#requirements)
    -   [Providers](#providers)
    -   [Modules](#modules)
    -   [Resources](#resources)
    -   [Inputs](#inputs)
    -   [Outputs](#outputs)
        </details>
        <!-- OTC-HEADER-END -->

# Overview

<!-- OTC-FOOTER-START -->

# Terraform Docs

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.3  |
| <a name="requirement_random"></a> [random](#requirement_random)          | ~> 3    |

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_random"></a> [random](#provider_random) | ~> 3    |

## Modules

No modules.

## Resources

| Name                                                                                                                   | Type     |
| ---------------------------------------------------------------------------------------------------------------------- | -------- |
| [random_string.customer_prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name                                                                        | Description                                                                       | Type                                                                                                                                                                                                      | Default            | Required |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------ | :------: |
| <a name="input_cloud_region"></a> [cloud_region](#input_cloud_region)       | Define the cloud region to use (AWS Region / Azure Location) which tf should use. | `string`                                                                                                                                                                                                  | n/a                |    yes   |
| <a name="input_custom_name"></a> [custom_name](#input_custom_name)          | Set custom name for deployment.                                                   | `string`                                                                                                                                                                                                  | `""`               |    no    |
| <a name="input_custom_tags"></a> [custom_tags](#input_custom_tags)          | A map of custom tags.                                                             | `map(string)`                                                                                                                                                                                             | `null`             |    no    |
| <a name="input_global_config"></a> [global_config](#input_global_config)    | Global config Object which contains the mandatory informations within OTC.        | <pre>object({<br>    env             = string<br>    customer_prefix = string<br>    project         = string<br>    application     = string<br>    costcenter      = optional(string, "")<br>  })</pre> | n/a                |    yes   |
| <a name="input_module_version"></a> [module_version](#input_module_version) | Add a special tag for versioning tags.                                            | `string`                                                                                                                                                                                                  | `"Commons Module"` |    no    |

## Outputs

| Name                                                                 | Description                                                                         |
| -------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| <a name="output_lc"></a> [lc](#output_lc)                            | The Location Code                                                                   |
| <a name="output_locals"></a> [locals](#output_locals)                | A Map of useful locals based on the input variables which can be referred from hcl. |
| <a name="output_name_prefix"></a> [name_prefix](#output_name_prefix) | The name prefix.                                                                    |
| <a name="output_sep"></a> [sep](#output_sep)                         | The used seperator                                                                  |
| <a name="output_tags"></a> [tags](#output_tags)                      | A Map of tags based on the input variables which can be referred from hcl.          |

<!-- END_TF_DOCS -->

<p align=right>Updated: https://github.com/otc-code/otc-res-common/actions/runs/4640729728</p>
<!-- OTC-FOOTER-END -->
