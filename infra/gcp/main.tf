resource "google_container_cluster" "primary" {
  name     = "chaos-carnival-cluster"
  location = "europe-west4-c"

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {

    client_certificate_config {
      issue_client_certificate = true
    }
  }
}

resource "google_container_node_pool" "addtional-nodes" {
  name       = "addtional-nodes"
  location   = "europe-west4-c"
  cluster    = google_container_cluster.primary.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
