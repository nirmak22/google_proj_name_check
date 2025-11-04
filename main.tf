provider "google" {
  credentials = base64decode(var.GOOGLE_CREDENTIALS_BASE64)
  project     = var.GOOGLE_PROJECT
  region      = var.GOOGLE_REGION
}

data "google_projects" "kyn_projects" {
  filter = "name:kyn*"
}

output "kyn_project_names" {
  value = [for project in data.google_projects.kyn_projects.projects : project.name]
}