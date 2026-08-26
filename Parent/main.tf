module "Usman_RG" {
    source = "../Module/RG"
    X= var.Y
  
}

module "SQL_Vnet" {
    depends_on = [ module.Usman_RG ]
    source = "../Module/VNET"
    virtual_network = var.Vnet_parent
  
}

module "Subnet" {
    depends_on = [ module.SQL_Vnet ]
    source = "../Module/Subnet"
    subnets=var.subnets
  }

module "pip" {
    depends_on = [ module.Usman_RG ]
  source ="../Module/Public_IP"
  pips=var.pips
}

module "NIC" {
    depends_on = [ module.Subnet, module.pip ]
    source = "../Module/NIC"
    NICs=var.NICs
  
}

module "VM" {
    depends_on = [ module.NIC ]
  source = "../Module/VM"
    VMs=var.VMs
}