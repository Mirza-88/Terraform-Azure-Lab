resource "azurerm_subnet" "Subnet" {
    for_each = var.subnets
  name                 = each.value.name
  resource_group_name  = each.value.Nic_RG
  virtual_network_name = each.value.Vnet_name
  address_prefixes     = each.value.address_prefixes
}