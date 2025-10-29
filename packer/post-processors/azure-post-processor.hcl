resource "azurerm_image" "hardened_linux_image" {
  name                = var.image_name
  resource_group_name = var.resource_group_name
  location            = var.location
  source_virtual_machine_id = azurerm_virtual_machine.hardened_vm.id

  os_type = "Linux"
}

output "image_id" {
  value = azurerm_image.hardened_linux_image.id
}