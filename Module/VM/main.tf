 data "azurerm_network_interface" "nic1" {
     for_each = var.VMs
name                = each.value.Nic_name
  resource_group_name = each.value.Nic_RG
}

resource "azurerm_linux_virtual_machine" "VM" {
    for_each = var.VMs
name = each.value.VM_name
resource_group_name = each.value.Nic_RG
location = each.value.VM_location
size = each.value.VM_size
admin_username = each.value.VM_username
admin_password = each.value.VM_password
disable_password_authentication = "false"

network_interface_ids = [data.azurerm_network_interface.nic1[each.key].id]



os_disk {
caching = "ReadWrite"
storage_account_type = "Standard_LRS"
}

source_image_reference {
publisher = "Canonical"
offer = "0001-com-ubuntu-server-jammy"
sku = "22_04-lts"
version = "latest"
}
}