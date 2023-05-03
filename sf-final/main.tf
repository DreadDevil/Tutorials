terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.89.0"
    }
  }
}

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
  v4_cidr_blocks = ["192.168.1.0/24"]
}

data "yandex_iam_service_account" "k8s_sa" {
  name = "k8s-sa"
}

resource "yandex_kubernetes_cluster" "this" {
  name                  = "my-k8s-cluster"
  description           = "Kubernetes cluster with 1 master and 1 app server"
  network_id            = yandex_vpc_network.default.id
  service_account_id    = data.yandex_iam_service_account.k8s_sa.id
  node_service_account_id = data.yandex_iam_service_account.k8s_sa.id

  master {
    version = "1.22"
    zonal {
      zone = var.yandex_cloud_zone
    }
  }
}

resource "yandex_kubernetes_node_group" "master" {
  name        = "master"
  description = "Kubernetes master node group"

  cluster_id = yandex_kubernetes_cluster.this.id

  labels = {
    type = "master"
  }

  instance_template {
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

  instance_template {
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
      image_id = "fd8fphfpeqijnlu1phu4"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
    nat       = true
  }

  metadata = {
    user-data = <<-EOF
      #cloud-config
      users:
        - name: yc-user
          ssh-authorized-keys:
            - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBXekn+DK9mN2/9HfWxbWXfljXgwDrgck9EA5Be2QJR9hBgVuUNrXT85YQ4rWzuaHrN9Trloaza5j5Dx9Uw0PsVNej9/Hm2nI1SEvpw3gdVp4d32FzY1KQ1pNCq5cSDB4ocpvMHogbT9jfY+aEGQm9ISlvXV6hps4FNS8iWYk1sXx1gQvryYLAVKlcgM/m7+0mFFl/pNzU5HtgBNPZBvPYUX1LM3t8EENxWXl1xs3Y3XQ628gGd+wTWSPfk3PFveXKg6ORf03JwnfUzh/NkK2SzqWwaVPAtoVY3Zm3ZCuixUSVhlcb+XsdsacBOLA9r5WUmMKr+cEAkPLMV5+L26ygiM++DfKTyBtbW8WEAGta7WPZRimNWPPPLBYRWvLhk1qeUsrkMIyHhdRujmj4VPrfd87gXg8k95+INkoRuiObmi9+BSPo90NBTSm7l3vjC6HV8nhUyXQbupvuYEvf5mTCNbFZqtIHm5w0gSq8Z0BGnYDmxUzRDtwS9Z9Xk+A5bSM= unepic@unepic-X553MA
    EOF
  }
}
