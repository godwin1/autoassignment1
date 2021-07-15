module "linux" {
  source = "./modules/vmlinux"
  depends_on = [ module.resource_group, module.common ]
  subnet_id = module.network.subnet1.id
  networkinterface =module.linux.vm1_nic


}

module "network" {
  source    = "./modules/network"
  subnet_id = module.network.subnet1.id
  depends_on = [module.resource_group, module.common ]
}


module "resource_group" {
  source = "./modules/rgroup"

}


module "window" {
  source     = "./modules/vmwindows"
  subnet_id  = module.network.subnet1.id
  depends_on = [module.resource_group, module.common ]
}
module "common" {
  source ="./modules/common"
  
}
module "database"{
  source ="./modules/database"

}
module "datadisk" {
  source ="./modules/datadisk"
  depends_on =[module.linux, module.common]
 
}

module "loadbalancer"{
source ="./modules/loadbalancer"
networkinterface = module.linux.vm1_nic

}
