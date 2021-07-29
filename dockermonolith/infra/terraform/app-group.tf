//terraform {
//  required_providers {
//    yandex = {
//      source = "yandex-cloud/yandex"
//    }
//  }
//}
//provider "yandex" {
//  service_account_key_file = var.service_account_key_file
//  cloud_id                 = var.cloud_id
//  folder_id                = var.folder_id
//  zone                     = var.zone
//}
//resource "yandex_compute_instance_group" "app-group" {
//  name                = "app-group"
//  folder_id           = var.folder_id
//  service_account_id  = var.service_account_id
//
//  instance_template {
//    platform_id = "standard-v1"
//    resources {
//      memory = 1
//      cores  = 2
//    }
//    boot_disk {
//      mode = "READ_WRITE"
//      initialize_params {
//        image_id = var.app_disk_image
//        size     = 4
//      }
//    }
//    network_interface {
//      network_id = var.network_id
//      subnet_ids = [var.subnet_id]
//    }
//    labels = {
//      label1 = "app-label"
//    }
//    metadata = {
//      ssh-keys = "ubuntu:${file(var.public_key_path)}"
//    }
//    network_settings {
//      type = "STANDARD"
//    }
//  }
//
//
//  scale_policy {
//    fixed_scale {
//      size = var.instance_count
//    }
//  }
//
//  allocation_policy {
//    zones = [var.zone]
//  }
//
//  deploy_policy {
//    max_unavailable = 1
//    max_creating    = 2
//    max_expansion   = 2
//    max_deleting    = 2
//  }
//}
