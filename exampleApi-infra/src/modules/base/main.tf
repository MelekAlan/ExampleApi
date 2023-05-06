resource "ovh_cloud_project_kube" "base-k8" {
  service_name  = var.project_id
  region        = var.region
  name          = "base-k8"
}

resource "ovh_cloud_project_kube_nodepool" "base-node-pool" {
  service_name  = var.project_id
  kube_id        = ovh_cloud_project_kube.base-k8.id
  name           = "base-node-pool"
  flavor_name    = "b2-7"
  desired_nodes  = 2
  max_nodes      = 2
  min_nodes      = 2
  monthly_billed = true
  autoscale      = false
}


resource "ovh_cloud_project_database" "base_database" {
  service_name  = var.project_id
  description   = "base-postresql-database" # not forces creating a new resource
  engine        = "postgresql"
  version       = "14"
  plan          = var.database_plan
  nodes {
    region      = var.base_region
  }
  flavor        = var.database_instance_flavor_size
}
