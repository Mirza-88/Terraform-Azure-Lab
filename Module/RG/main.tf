resource "azurerm_resource_group" "Usman_RG" {
    for_each = var.RG
name = each.value.name
location = each.value.location
}