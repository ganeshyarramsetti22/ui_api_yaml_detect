terraform {
  required_version = ">= 1.6.0"
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-fullstack"
    storage_account_name = "stfullstackcicd2026"
    container_name       = "tfstate"
    key                  = "fullstack.tfstate"
    use_azuread_auth     = true

  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "main" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "ui" {
  name                = var.ui_app_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  service_plan_id     = azurerm_service_plan.main.id
  https_only          = true

  site_config {
    application_stack {
      node_version = var.node_version
    }

    app_command_line = "pm2 serve /home/site/wwwroot --no-daemon --spa"
  }
}

resource "azurerm_linux_web_app" "api" {
  name                = var.api_app_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  service_plan_id     = azurerm_service_plan.main.id
  https_only          = true

  site_config {
    application_stack {
      node_version = var.node_version
    }
  }

  app_settings = {
    PORT                           = var.api_port
    SCM_DO_BUILD_DURING_DEPLOYMENT = "true"
  }
}