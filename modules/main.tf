module "vpc" {
  source                 = "./modules/vpc"
  vpc_cidr               = "10.0.0.0/16"
  public_subnet_1_cidr   = "10.0.1.0/24"
  public_subnet_2_cidr   = "10.0.2.0/24"
}

module "ecs" {
  source            = "./modules/ecs"
  vpc_id            = module.vpc.vpc_id
  subnets           = module.vpc.public_subnet_ids
  nginx_image       = "nginx:alpine"
}
