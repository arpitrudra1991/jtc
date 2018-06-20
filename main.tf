resource "azurerm_resource_group" "arpittest" {
  name     = "acctestrg-01"
  location = "West US"
}

#your armtemplate part where you can pass the json file
resource "azurerm_template_deployment" "artest" {
  name                = "acctesttemplate-01"
  resource_group_name = "${azurerm_resource_group.arpittest.name}"
  template_body       = "${file("${path.module}/resource.json")}"


  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters {
    "storageAccountType" = "Standard_GRS"
  }

  deployment_mode = "Incremental"
}

output "storageAccountName" {
  value = "${azurerm_template_deployment.artest.outputs["storageAccountName"]}"
}
