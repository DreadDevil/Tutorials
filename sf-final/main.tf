provider "yandex" {
  token     = var.yandex_cloud_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_cloud_folder_id
  zone      = var.yandex_cloud_zone
}

variable "yandex_cloud_token" {
  type        = string
  description = "API token for Yandex Cloud"
}

variable "yandex_cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
}

variable "yandex_cloud_folder_id" {
  type        = string
  description = "Yandex Cloud folder ID"
}

variable "yandex_cloud_zone" {
  type        = string
  description = "Yandex Cloud zone"
}

resource "yandex_vpc_network" "default" {
  name = "my-network"
}

resource "yandex_vpc_subnet" "default" {
  name           = "my-subnet"
  zone           = var.yandex_cloud_zone
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["192.168.0.0/24"]
}

resource "yandex_kubernetes_cluster" "this" {
  name        = "my-k8s-cluster"
  description = "Kubernetes cluster with 1 master and 1 app server"

  network_id = yandex_vpc_network.default.id

  master {
    version = "1.22"
    zone    = var.yandex_cloud_zone
  }
}

resource "yandex_kubernetes_node_group" "master" {
  name        = "master"
  description = "Kubernetes master node group"

  cluster_id = yandex_kubernetes_cluster.this.id

  labels = {
    type = "master"
  }

  template {
    platform_id = "standard-v2"
    resources {
      cores  = 2
      memory = 4
    }
  }

  scale_policy {
    fixed_scale {
      size = 1
    }
  }
}

resource "yandex_kubernetes_node_group" "app" {
  name        = "app"
  description = "Kubernetes app node group"

  cluster_id = yandex_kubernetes_cluster.this.id

  labels = {
    type = "app"
  }

  template {
    platform_id = "standard-v2"
    resources {
      cores  = 2
      memory = 4
    }
  }

  scale_policy {
    fixed_scale {
      size = 1
    }
  }
}

resource "yandex_compute_instance" "srv" {
  name = "srv"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8v89h92"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
  }
}