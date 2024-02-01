terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-state-bucket-mentor"
    region     = "ru-central1-a"
    key        = "issue1/lemp.tfstate"
    access_key = "YCAJEPr6lZRlHoXG8Ulk4eqAW"
    secret_key = "YCOpSp002-T1I2NsvonwSRMtnvGbUhI2yPxFFjr4"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
provider "yandex" {
  token     = "y0_AgAAAABmOtwFAATuwQAAAADVYJG9wgJFmqsESdCTNX0QRhiCkansvq"
  cloud_id  = "<b1g0utbakijalqm7pqve"
  folder_id = "b1g4oh4ltrfd2mnlravq"
  zone      = "ru-central1-a"
}
