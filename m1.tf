provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "bajaj-local" {
    location = "eastus"
    name="terra"
  
}