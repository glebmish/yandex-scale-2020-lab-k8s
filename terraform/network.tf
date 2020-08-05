resource "yandex_vpc_network" "lab-network" {
  name = "lab-network"
}

resource "yandex_vpc_subnet" "lab-subnet-b" {
  name = "lab-subnet-b"
  v4_cidr_blocks = ["10.3.0.0/16"]
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.lab-network.id
}
