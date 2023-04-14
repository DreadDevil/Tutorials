provider "yandex" {
  service_account_key_file = "/path/to/service-account-key.json"
  cloud_id                 = var.your-cloud-id
  folder_id                = var.your-folder-id
  zone                     = var.your-zone
}

variable "your-cloud-id" {}
variable "your-folder-id" {}
variable "your-zone" {}
variable "your-master-image-id" {}
variable "your-worker-image-id" {}
variable "your-srv-image-id" {}
variable "your-ssh-public-key" {}

resource "yandex_vpc_network" "vpc_network" {
  name = "my-network"
}

resource "yandex_vpc_subnet" "vpc_subnet" {
  name           = "my-subnet"
  zone           = var.your-zone
  vpc_network_id = yandex_vpc_network.vpc_network.id

  range {
    from = "10.0.0.0"
    to   = "10.0.0.255"
  }
}

resource "yandex_compute_instance" "k8s_master_instance" {
  name = "k8s-master"
  zone = var.your-zone

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.your-master-image-id
    }
  }

  network_interfaces {
    subnet_id = yandex_vpc_subnet.vpc_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = var.your-ssh-public-key
  }
}

resource "yandex_compute_instance" "k8s_worker_instance" {
  name = "k8s-worker"
  zone = var.your-zone

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.your-worker-image-id
    }
  }

  network_interfaces {
    subnet_id = yandex_vpc_subnet.vpc_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = var.your-ssh-public-key
  }
}

resource "yandex_compute_instance" "srv_instance" {
  name = "srv"
  zone = var.your-zone

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.your-srv-image-id
    }
  }

  network_interfaces {
    subnet_id = yandex_vpc_subnet.vpc_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = var.your-ssh-public-key
  }
}
