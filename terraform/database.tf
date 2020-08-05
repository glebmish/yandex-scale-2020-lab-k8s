locals {
  dbuser = tolist(yandex_mdb_postgresql_cluster.lab-postgresql.user.*.name)[0]
  dbpassword = tolist(yandex_mdb_postgresql_cluster.lab-postgresql.user.*.password)[0]
  dbhosts = yandex_mdb_postgresql_cluster.lab-postgresql.host.*.fqdn
  dbname = tolist(yandex_mdb_postgresql_cluster.lab-postgresql.database.*.name)[0]
  dburi = "postgresql://${local.dbuser}:${local.dbpassword}@:1/${local.dbname}"
}

resource "yandex_mdb_postgresql_cluster" "lab-postgresql" {
  name        = "lab-postgresql"
  folder_id   = var.yc_folder
  environment = "PRODUCTION"
  network_id  = yandex_vpc_network.lab-network.id

  config {
    version = 12
    resources {
      resource_preset_id = "s2.small"
      disk_type_id       = "network-ssd"
      disk_size          = 64
    }
  }

  database {
    name  = "db"
    owner = "user"
  }

  user {
    name     = "user"
    password = "password"
    permission {
      database_name = "db"
    }
  }

  host {
    zone      = "ru-central1-b"
    subnet_id = yandex_vpc_subnet.lab-subnet-b.id
    assign_public_ip = true
  }
}
