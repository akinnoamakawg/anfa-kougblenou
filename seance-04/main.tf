# main.tf — Stack complète Anfa via Terraform
# ────────────────────────────────────────────

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "anfa_net" {
  name = "anfa-network"
}

resource "docker_volume" "minio_data" {
  name = "anfa-minio-data-tf"
}

resource "docker_image" "minio" {
  name = "minio/minio:latest"
}

resource "docker_container" "minio" {
  name  = "anfa-minio-tf"
  image = docker_image.minio.image_id

  command = ["server", "/data", "--console-address", ":9001"]
  restart = "unless-stopped"

  ports {
    internal = 9000
    external = 9010
  }
  ports {
    internal = 9001
    external = 9011
  }

  env = [
    "MINIO_ROOT_USER=anfa-admin",
    "MINIO_ROOT_PASSWORD=nouveau-mot-de-passe-2026",
  ]

  volumes {
    volume_name    = docker_volume.minio_data.name
    container_path = "/data"
  }

  networks_advanced {
    name = docker_network.anfa_net.name
  }

  # Certains moteurs Docker (OrbStack, Docker Desktop récents) injectent des
  # options de log par défaut absentes du code. Sans cette ligne, Terraform
  # détecterait une dérive à chaque plan et recréerait le conteneur (l'idempotence
  # serait cassée). On ignore donc ce champ géré par le moteur.
  lifecycle {
    ignore_changes = [log_opts]
  }
}
