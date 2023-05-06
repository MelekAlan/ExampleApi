
module "base" {
  source = "./modules/base"

  project_id = var.project_id
  region = var.region
  base_region = var.base_region

  database_plan = var.database_plan
  database_instance_flavor_size = var.database_instance_flavor_size
  
}
