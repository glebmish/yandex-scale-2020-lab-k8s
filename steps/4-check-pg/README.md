# Проверка созданных ресурсов

## Проверка кластера PostgreSQL

1. Вернитесь к терминалу с запущенным Terraform. По завершении работы в секции `Outputs` можно будет увидеть данные о кластере.

1. Сохраните данные о кластере в переменные окружения:
```
export DATABASE_URI=<database_uri>
echo "export DATABASE_URI=$DATABASE_URI" >> ~/.bashrc
export DATABASE_HOSTS=<database_hosts>
echo "export DATABASE_URI=$DATABASE_HOSTS" >> ~/.bashrc
```

2. Проверьте результат работы Terraform:
```
yc managed-postgresql cluster list
yc managed-postgresql cluster get --id=<PG_ID>
```
