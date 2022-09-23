terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "store-manager-2" {
  name            = "store-manager-2"
  check_duplicate = true
  driver          = "bridge"
  ipam_driver     = "default"
  ipam_config {
    subnet  = "172.23.0.0/16"
    gateway = "172.23.0.1"
  }
}

resource "docker_image" "eo-lads-rest-api-backend" {
  name = "eo-lads-rest-api-backend"
}


resource "docker_image" "store-manager-jvm" {
  name = "quarkus/store-manager-jvm:latest"
}


resource "docker_container" "eo-lads-rest-api-backend" {
  image = "eo-lads-rest-api-backend"
  name  = "eo-lads-rest-api-backend"
  ports {
    internal = 8080
    external = 8080
  }
  network_mode = "bridge"
  networks_advanced {
    name = "store-manager-2"
  }
  depends_on = [docker_network.store-manager-2]
}

resource "docker_container" "backend-1" {
  image = "quarkus/store-manager-jvm:latest"
  name  = var.store_container_name
  ports {
    internal = 8070
    external = 8070
  }
  network_mode = "bridge"
  networks_advanced {
    name = "store-manager-2"
  }
  depends_on = [docker_network.store-manager-2]
}

