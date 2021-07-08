module "linux" {
  source = "./modules/vmlinux"
  depends_on = [ module.resource_group,  ]
  subnet_id = module.network.subnet1.id
  // virtual_machine_id =module.linux.linuxvm1.id


}

module "network" {
  source    = "./modules/network"
  subnet_id = module.network.subnet1.id
  depends_on = [module.resource_group,  ]
}


module "resource_group" {
  source = "./modules/rgroup"

}


module "window" {
  source     = "./modules/vmwindows"
  subnet_id  = module.network.subnet1.id
  depends_on = [module.resource_group, ]
}
module "common" {
  source ="./modules/common"
}
module "database"{
  source ="./modules/database"

}
module "datadisk" {
  source ="./modules/datadisk"
  depends_on =[module.linux]
 
}

module "loadbalancer"{
source ="./modules/loadbalancer"
}
