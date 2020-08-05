# Первоначальное разворачивание k8s в Облаке
## Создание сервисных аккаунтов
2. Создайте сервисный аккаунт `k8s-cluster-manager` с ролью `editor`.
1. Создайте сервисный аккаунт `k8s-image-puller` с ролью `container-registry.images.puller`;

## Создание кластера
1. Создайте ресурс `Кластер Kubernetes` с именем lab-k8s:
* Укажите `k8s-cluster-manager` в качестве сервисного аккаунта для ресурсов;
* Укажите `k8s-image-puller` в качестве сервисного аккаунта для узлов;
* Дождитесь создания кластера.

## Создание группы узлов
1. Создайте группу узлов с именем `lab-k8s-group`:
* Доступ внутрь ВМ нам не потребуется, поэтому в разделе `Доступ` можно ввести любой текст.

## Проверка состояния кластера
```
yc managed-kubernetes cluster list
export K8S_ID=<ID>
yc managed-kubernetes cluster --id=$K8S_ID get
yc managed-kubernetes cluster --id=$K8S_ID list-node-groups
```

## Добавление учетных данных в конфигурационный файл kubectl
```
yc managed-kubernetes cluster get-credentials --id=$K8S_ID --external
```
Конфигурация будет записана в файл `~/.kube/config`, проверим его содержимое:
```
cat ~/.kube/config
```
