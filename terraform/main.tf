provider "google" {
  credentials = "C:\\Users\\AVASILAC\\Desktop\\Credentiale\\credentiale.json"
  project     = "webapp-deploy-395414"
  region      = "europe-west1"
}

resource "google_container_cluster" "gke_cluster" {
  name               = "my-gke-cluster"
  location           = "europe-west1-b"
  initial_node_count = 3
}

resource "google_sql_database_instance" "my_db_instance" {
  name             = "my-database-instance"
  database_version = "MYSQL_8_0"
  region           = "europe-west1"

  settings {
    tier = "db-f1-micro"
    backup_configuration {
      enabled = true
    }
  }
}