Y={
      RG = {
        name = "SQL"
        location = "Central India"
      }

     }

Vnet_parent ={

      Vnet ={
        name = "Usman_VNET"
        resource_group_name = "SQL"
        location = "Central India"
        address_space = ["10.0.0.0/16"]
}

}     
subnets={
  Subnet1={
    name              = "Frontend_Snet"
  Nic_RG  = "SQL"
  Vnet_name= "Usman_VNET"
  address_prefixes     = ["10.0.1.0/24"]

  }
  Subnet2={
    name               = "Backend_Snet"
  Nic_RG  = "SQL"
  Vnet_name = "Usman_VNET"
  address_prefixes     = ["10.0.0.0/24"]

  }
}
pips ={
  PIP1={
     name                = "Frontend_pip"
  resource_group_name = "SQL"
  location            = "Central India"
  allocation_method   = "Static"
}
PIP2={
     name                = "Backend_pip"
  resource_group_name = "SQL"
  location            = "Central India"
  allocation_method   = "Static"
}}
NICs={
  NIC1={
   Nic_name ="Frontend_NIC"
    Nic_RG ="SQL"
    VM_location="Central India"
    Subnet_name= "Frontend_Snet"
    Public_IP="Frontend_pip"
    Vnet_name = "Usman_VNET"
  }
   NIC2={
   Nic_name ="Backend_NIC"
    Nic_RG ="SQL"
    VM_location="Central India"
    Subnet_name= "Backend_Snet"
    Public_IP="Backend_pip"
    Vnet_name = "Usman_VNET"
  }
  
}

VMs={
  VM1={
    Nic_name ="Frontend_NIC"
    Nic_RG ="SQL"
    VM_name= "FrontendVM"
    VM_location="Central India"
    VM_size= "Standard_D2s_v5"
    VM_username="Saqlain"
    VM_password="Saqlain12345"
     Subnet_name= "Frontend_Snet"
    Public_IP="Frontend_pip"
    Vnet_name = "Usman_VNET"
  }

    VM2={
    Nic_name ="Backend_NIC"
    Nic_RG ="SQL"
    VM_name= "BackendVM"
    VM_location="Central India"
    VM_size= "Standard_D2s_v5"
    VM_username="Saqlain"
    VM_password="Saqlain12345"
    Subnet_name= "Backend_Snet"
    Public_IP="Backend_pip"
    Vnet_name="Usman_VNET"
  }
}