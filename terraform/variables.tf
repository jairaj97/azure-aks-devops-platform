variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-resource-tf-lab"
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
  default     = "Central India"
}