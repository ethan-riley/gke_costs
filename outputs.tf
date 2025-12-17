# outputs.tf
output "cluster_name" {
  value = google_container_cluster.pricing_test.name
}

output "cluster_endpoint" {
  value = google_container_cluster.pricing_test.endpoint
}

output "node_pools" {
  value = {
    n1_standard_4          = google_container_node_pool.n1_standard_4.name
    n1_standard_8          = google_container_node_pool.n1_standard_8.name
    n1_highmem_16          = google_container_node_pool.n1_highmem_16.name
    n2d_highcpu_16         = google_container_node_pool.n2d_highcpu_16.name
    n2d_highcpu_16_spot    = google_container_node_pool.n2d_highcpu_16_spot.name
    n4d_highcpu_48         = google_container_node_pool.n4d_highcpu_48.name
    n4d_highcpu_48_spot    = google_container_node_pool.n4d_highcpu_48_spot.name
    n4_highmem_8           = google_container_node_pool.n4_highmem_8.name
    n4_highmem_8_spot      = google_container_node_pool.n4_highmem_8_spot.name
    c3d_standard_90        = google_container_node_pool.c3d_standard_90.name
  }
}
