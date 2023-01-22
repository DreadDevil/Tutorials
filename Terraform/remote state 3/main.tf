terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-state-bucket-user"
    region     = "ru-central1-a"
    key        = "issue1/lemp.tfstate"
    access_key = "YCAJEPr6lZRlHoXG8Ulk4eqAW"
    secret_key = "YCOpSp002-T1I2NsvonwSRMtnvGbUhI2yPxFFjr4"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
provider "yandex" {
  token     = "y0_AgAAAABmOtwFAATuwQAAAADVYJG9wgJFmqsESdCTNX0QRhiCkansvqA"
  cloud_id  = "<b1g0utbakijalqm7pqve>"
  folder_id = "b1g4oh4ltrfd2mnlravq"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "network" {
  name = "network"
}

resource "yandex_vpc_subnet" "subnet1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "subnet2" {
  name           = "subnet2"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.11.0/24"]
}


module "ya_instance_1" {
  source                = "./modules/instance"
  instance_family_image = "lemp"
  vpc_subnet_id         = yandex_vpc_subnet.subnet1.id
}

module "ya_instance_2" {
  source                = "./modules/instance"
  instance_family_image = "lamp"
  vpc_subnet_id         = yandex_vpc_subnet.subnet2.id
}
