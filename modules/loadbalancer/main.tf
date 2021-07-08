resource "azurerm_lb" "loadbalancer" {
  name                = var.lb
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.vm1_pip.id
  }
}
resource "azurerm_public_ip" "vm1_pip" {
  tags                = local.common_tags
  name                = "${var.vm_linux_name}-pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_lb_backend_address_pool" "addresspool" {
  loadbalancer_id = azurerm_lb.loadbalancer.id
  name            = "BackEndAddressPool"
   resource_group_name = var.rg_name
}
resource "azurerm_lb_rule" "lbrule" {
  resource_group_name            = var.rg_name
  loadbalancer_id                = azurerm_lb.loadbalancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
} 
resource "azurerm_lb_probe" "lbprobe" {
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.loadbalancer.id
  name                = "ssh-running-probe"
  port                = 22
}