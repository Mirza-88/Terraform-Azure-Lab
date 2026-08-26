data "azurerm_subnet" "Subnet_DB" {
    for_each = var.NICs
name = each.value.Subnet_name
virtual_network_name = each.value.Vnet_name
resource_group_name = each.value.Nic_RG
}

data "azurerm_public_ip" "PIP" {
    for_each = var.NICs
name = each.value.Public_IP
resource_group_name = each.value.Nic_RG
}

resource "azurerm_network_interface" "NIC" {
    for_each = var.NICs
  name                = each.value.Nic_name
  location            = each.value.VM_location
  resource_group_name = each.value.Nic_RG

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.Subnet_DB[each.key].id
    public_ip_address_id = data.azurerm_public_ip.PIP[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

