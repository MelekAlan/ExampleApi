terraform {
  backend "s3" {
    bucket                      = "tfstateexample"
    key                         = "terraform.tfstate"
    access_key                  = "xxxxxxx"
    region                      = "gra"
    secret_key                  = "xxxxxxxx"
    endpoint                    = "xxxxxxxx"
    skip_credentials_validation = true
    skip_region_validation      = true
    force_path_style            = true
  }
}
