# ---------------------------------------------------------------------------------------------------------------------
# Global Variables
# ---------------------------------------------------------------------------------------------------------------------
variable "cloud_region" {
  type        = string
  description = "Define the cloud region to use (AWS Region / Azure Location) which tf should use."
  validation {
    condition = contains(["af-south-1", "ap-east-1", "ap-northeast-1",
      "ap-northeast-2", "ap-northeast-3", "ap-south-1",
      "ap-southeast-1", "ap-southeast-2", "australiaeast",
      "ca-central-1", "canadacentral", "centralindia",
      "centralus", "eastasia", "eastus", "eu-central-1",
      "eastus2", "eu-north-1", "eu-south-1",
      "eu-west-1", "eu-west-2", "eu-west-3",
      "francecentral", "germanywestcentral", "japaneast",
      "jioindiawest", "koreacentral", "me-south-1",
      "northcentralus", "northeurope", "norwayeast",
      "sa-east-1", "southafricanorth", "southcentralus",
      "southeastasia", "swedencentral", "switzerlandnorth",
      "uaenorth", "uksouth", "us-east-1",
      "us-east-2", "us-west-1", "us-west-2",
      "westeurope", "westus", "westus2",
      "westus3"
    ], lower(var.cloud_region))
    error_message = "Valid values for cloud_region: af-south-1, ap-east-1, ap-northeast-1, ap-northeast-2, ap-northeast-3, ap-south-1, ap-southeast-1, ap-southeast-2, australiaeast, ca-central-1, canadacentral, centralindia, centralus, eastasia, eastus, eu-central-1, eastus2, eu-north-1, eu-south-1, eu-west-1, eu-west-2, eu-west-3, francecentral, germanywestcentral, japaneast, jioindiawest, koreacentral, me-south-1, northcentralus, northeurope, norwayeast, s-east-1, southafricanorth, southcentralus, southeastasia, swedencentral, switzerlandnorth, uaenorth, uksouth, us-east-1, us-east-2, us-west-1, us-west-2, westeurope, westus, westus2, westus3 ."
  }
}

variable "global_config" {
  type = object({
    env             = string
    customer_prefix = string
    project         = string
    application     = string
    costcenter      = optional(string, "")
  })
  description = "Global config Object which contains the mandatory informations within OTC."

  validation {
    condition     = length(var.global_config.env) < 4 && length(regexall("[^a-zA-Z0-9]", var.global_config.env)) == 0
    error_message = "The environment must not be longer than 3 characters and only contain letters and numbers. The Environment SCP is reserverd for the SCP Plattform, please do not use!"
  }

  validation {
    condition     = var.global_config.customer_prefix == "" || (length(var.global_config.customer_prefix) < 5 && length(regexall("[^a-zA-Z0-9]", var.global_config.customer_prefix)) == 0)
    error_message = "The customer_prefix must be either empty and not longer than 4 characters containing only letters and numbers."
  }
  validation {
    condition     = length(var.global_config.project) < 11 && length(regexall("[^a-zA-Z0-9-]", var.global_config.project)) == 0
    error_message = "The project must not be longer than 10 characters and only contain letters, '-' and numbers."
  }
  validation {
    condition     = length(var.global_config.application) < 16 && length(regexall("[^a-zA-Z0-9-]", var.global_config.application)) == 0
    error_message = "The application must not be longer than 15 characters and only contain letters, '-' and numbers."
  }
}

variable "module_version" {
  type        = string
  default     = "Commons Module"
  description = "Add a special tag for versioning tags."

}
# ---------------------------------------------------------------------------------------------------------------------
# Custom Variables
# ---------------------------------------------------------------------------------------------------------------------
variable "custom_tags" {
  type        = map(string)
  default     = null
  description = "Set custom tags for deployment."
}

variable "custom_name" {
  type        = string
  default     = ""
  description = "Set custom name for deployment."
  validation {
    condition     = length(var.custom_name) < 16 && length(regexall("[^a-zA-Z0-9-]", var.custom_name)) == 0
    error_message = "The custom name must not be longer than 15 characters and only contain letters, '-' and numbers."
  }
}

