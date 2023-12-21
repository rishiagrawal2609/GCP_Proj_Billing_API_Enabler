# Terraform file for the creation of service account and providing access

#Header start
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}
#Header End
# locals {
#   checkrole = var.role_id == null ? 0:1
# }
#data collector 
data "google_projects" "my-org-projects" {
  filter = "parent.id:${var.org_id}"
}


# Resource to execute the python script that will enable the apis. 
resource "null_resource" "Project_script" {
 provisioner "local-exec" {  
    command = "/usr/bin/python3 extractor.py "
  }
}

