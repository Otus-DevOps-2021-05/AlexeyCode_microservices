terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}
provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "app" {
  name  = "reddit-app-${count.index}"
  count = var.instance_count

  labels = {
    tags = "reddit-app"
  }
  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
      size = 50
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  scheduling_policy {
    preemptible = true
  }

  connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }
}
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tmpl", {
    hostname_app = yandex_compute_instance.app.*.network_interface.0.nat_ip_address
    }
  )
  filename = "../ansible/inventory"
}
