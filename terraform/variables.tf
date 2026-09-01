variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "app_service_plan_name" {
  description = "App Service Plan name"
  type        = string
}

variable "ui_app_name" {
  description = "UI App Service name"
  type        = string
}

variable "api_app_name" {
  description = "API App Service name"
  type        = string
}

variable "os_type" {
  description = "Operating system for App Service Plan"
  type        = string
}

variable "sku_name" {
  description = "SKU for App Service Plan"
  type        = string
}

variable "node_version" {
  description = "Node.js version for App Services"
  type        = string
}

variable "api_port" {
  description = "Port used by the API application"
  type        = string
}