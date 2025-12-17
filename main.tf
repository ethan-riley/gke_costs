# main.tf
terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# GKE Cluster
resource "google_container_cluster" "pricing_test" {
  name     = "pricing-test-cluster"
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = "default"
  subnetwork = "default"

  deletion_protection = false
}

# Node pools for recommended instance types from porch-production analysis
# Mode: with_commitments_with_limits

resource "google_container_node_pool" "n1_standard_4" {
  name       = "n1-standard-4-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "n1-standard-4"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "with-commitments-with-limits"
    }
  }
}

resource "google_container_node_pool" "n1_standard_8" {
  name       = "n1-standard-8-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "n1-standard-8"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "with-commitments-with-limits"
    }
  }
}

resource "google_container_node_pool" "n1_highmem_16" {
  name       = "n1-highmem-16-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "n1-highmem-16"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "with-commitments-with-limits"
    }
  }
}

resource "google_container_node_pool" "n1_highcpu_4" {
  name       = "n1-highcpu-4-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "n1-highcpu-4"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "with-commitments-with-limits"
    }
  }
}

resource "google_container_node_pool" "n1_highcpu_16" {
  name       = "n1-highcpu-16-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "n1-highcpu-16"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "with-commitments-with-limits"
    }
  }
}

# Mode: with_commitments_no_limits / no_commitments_no_limits

resource "google_container_node_pool" "n2d_highcpu_16" {
  name       = "n2d-highcpu-16-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "n2d-highcpu-16"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal"
    }
  }
}

resource "google_container_node_pool" "n4d_highcpu_48" {
  name       = "n4d-highcpu-48-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "n4d-highcpu-48"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal"
    }
  }
}

resource "google_container_node_pool" "n4_highmem_8" {
  name       = "n4-highmem-8-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "n4-highmem-8"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal"
    }
  }
}

resource "google_container_node_pool" "c3d_standard_90" {
  name       = "c3d-standard-90-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "c3d-standard-90"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal"
    }
  }
}

resource "google_container_node_pool" "n4d_standard_4" {
  name       = "n4d-standard-4-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "n4d-standard-4"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal"
    }
  }
}

resource "google_container_node_pool" "c2d_standard_4" {
  name       = "c2d-standard-4-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "c2d-standard-4"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal"
    }
  }
}

resource "google_container_node_pool" "c2d_highcpu_8" {
  name       = "c2d-highcpu-8-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "c2d-highcpu-8"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal"
    }
  }
}

resource "google_container_node_pool" "t2d_standard_8" {
  name       = "t2d-standard-8-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "t2d-standard-8"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal"
    }
  }
}

resource "google_container_node_pool" "e2_standard_8" {
  name       = "e2-standard-8-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "e2-standard-8"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal"
    }
  }
}

resource "google_container_node_pool" "c3_standard_4" {
  name       = "c3-standard-4-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "c3-standard-4"
    disk_size_gb = 100
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal"
    }
  }
}

# Spot instance variants
resource "google_container_node_pool" "n2d_highcpu_16_spot" {
  name       = "n2d-highcpu-16-spot-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "n2d-highcpu-16"
    disk_size_gb = 100
    disk_type    = "pd-standard"
    spot         = true

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal-spot"
    }
  }
}

resource "google_container_node_pool" "n4d_highcpu_48_spot" {
  name       = "n4d-highcpu-48-spot-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "n4d-highcpu-48"
    disk_size_gb = 100
    disk_type    = "pd-standard"
    spot         = true

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal-spot"
    }
  }
}

resource "google_container_node_pool" "n4_highmem_8_spot" {
  name       = "n4-highmem-8-spot-pool"
  location   = var.region
  cluster    = google_container_cluster.pricing_test.name
  node_count = 1

  node_config {
    machine_type = "n4-highmem-8"
    disk_size_gb = 100
    disk_type    = "pd-standard"
    spot         = true

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      pool_type = "optimal-spot"
    }
  }
}
