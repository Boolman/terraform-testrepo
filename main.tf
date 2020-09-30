
locals {
  commonfile = yamldecode(file("common.yaml"))
}
module "random" {
  source = "./modules/rand"
  common = merge(local.commonfile["global"], local.commonfile["random"])
}


module "echo" {
  // source = "git@github.com:hashicorp/example.git"
  // source = "git::https://example.com/vpc.git?ref=v1.2.0"
  source     = "./modules/service"
  for_each   = local.commonfile["echo"]
  depends_on = [module.random]
  cmd        = "echo ${module.random.rand.hex}"
}
