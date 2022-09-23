output "container_id_eo-lads-rest-api-backend" {
  description = "ID of the Docker container -> eo-lads-rest-api-backend"
  value       = docker_container.eo-lads-rest-api-backend.id
}

output "image_id_eo-lads-rest-api-backend" {
  description = "ID of the Docker image -> eo-lads-rest-api-backend"
  value       = docker_image.eo-lads-rest-api-backend.id
}

output "container_id_store-manager-jvm" {
  description = "ID of the Docker container -> store-manager-jvm"
  value       = docker_container.backend-1.id
}

output "image_id_store-manager-jvm" {
  description = "ID of the Docker image -> store-manager-jvm"
  value       = docker_image.store-manager-jvm.id
}

output "network_id" {
  description = "ID of the Docker image -> store-manager-jvm"
  value       = docker_network.store-manager-2.id
}

output "network_ipv6" {
  description = "ID of the Docker image -> store-manager-jvm"
  value       = docker_network.store-manager-2.ipv6
}

