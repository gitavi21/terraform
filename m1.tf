provider "azurerm" {
    features {}
}
variable "location" {
  default = "eastus"
}
variable "name" {
  default = "newrs1"
}
resource "azurerm_resource_group" "resvar" {
  location = var.location
  name = var.name
  tags = {
    Name = "Aviral"
    Day = "Friday"
  }
}
resource "azurerm_cosmosdb_account" "GlobalDocumentDB" {
  name                      = var.name
  location                  = var.location
  resource_group_name       = azurerm_resource_group.resvar.name
  offer_type                = "Standard"
  kind                      = "GlobalDocumentDB"
  enable_automatic_failover = false
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
}