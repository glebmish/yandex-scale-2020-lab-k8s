# Подготовка docker-образов
## Создание Container Registry
1. Создайте registry: `yc container registry create --name lab-registry`;
2. Проверьте его наличие через терминал: `yc container registry list`;
3. Настройте аутентификацию в docker:
```
yc container registry configure-docker
cat ~/.docker/config.json
```
Файл `config.json` содержит вашу конфигурацию после авторизации:
```
{
  "credHelpers": {
    "container-registry.cloud.yandex.net": "yc",
    "cr.cloud.yandex.net": "yc",
    "cr.yandex": "yc"
  }
```

## Сборка и загрузка docker-образов в Container Registry 
1. Переходим в исходники приложения:
```
cd $REPO/app
```

2. Собираем образ приложения: 
```
yc container registry list
export REGISTRY_ID=<ID>
sudo docker build . --tag cr.yandex/$REGISTRY_ID/lab-demo:v1
```

3. Загружаем образ
```
sudo docker push cr.yandex/$REGISTRY_ID/lab-demo:v1
```

## Просмотр списка docker-образов

Получить список Docker-образов в реестре можно командой `yc container image list`
В результате в таблице будет ID образа, дата его создания, месторасположение и т.д.
Получить информацию о конкретном Docker-образе можно командой `yc container image get <IMAGE_ID>`






