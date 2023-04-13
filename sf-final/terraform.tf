provider "yandex" {
  service_account_key_file = "/path/to/service-account-key.json"
  cloud_id                 = "your-cloud-id"
  folder_id                = "your-folder-id"
  zone                     = "your-zone"
}

resource "yandex_vpc_network" "vpc_network" {
  name = "my-network"
}

resource "yandex_vpc_subnet" "vpc_subnet" {
  name           = "my-subnet"
  zone           = "your-zone"
  vpc_network_id = yandex_vpc_network.vpc_network.id

  range {
    from = "10.0.0.0"
    to   = "10.0.0.255"
  }
}

resource "yandex_compute_instance" "k8s_master_instance" {
  name = "k8s-master"
  zone = "your-zone"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "your-master-image-id"
    }
  }

  network_interfaces {
    subnet_id = yandex_vpc_subnet.vpc_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "your-ssh-public-key"
  }
}

resource "yandex_compute_instance" "k8s_worker_instance" {
  name = "k8s-worker"
  zone = "your-zone"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "your-worker-image-id"
    }
  }

  network_interfaces {
    subnet_id = yandex_vpc_subnet.vpc_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "your-ssh-public-key"
  }
}

resource "yandex_compute_instance" "srv_instance" {
  name = "srv"
  zone = "your-zone"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "your-srv-image-id"
    }
  }

  network_interfaces {
    subnet_id = yandex_vpc_subnet.vpc_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "your-ssh-public-key"
  }
}
