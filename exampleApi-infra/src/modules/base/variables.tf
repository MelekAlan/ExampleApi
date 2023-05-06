
variable "project_id" {
  description = "The id of the public cloud project"
}

variable "region" {
  description = "The id of the OpenStack region"
}

variable "base_region" {
  description = "The id of the OpenStack base region (country)"
}

variable "database_plan" {
  description = "The database plan (essential, business)"
}

variable "database_instance_flavor_size" {
  description = "The compute instance size of the database"
}
