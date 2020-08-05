# Удаление ресурсов

## Удаление ресурсов из кластера k8s
```
kubectl delete -f load-balancer.yaml
kubectl delete -f lab-demo.yaml
```

## Удаление кластера k8s
```
yc managed-kubernetes cluster list
yc managed-kubernetes cluster delete lab-k8s
yc iam service-account delete k8s-cluster-manager
yc iam service-account delete k8s-image-puller
yc managed-kubernetes cluster list
```

## Удаление базы данных в Terraform
```
cd $REPO/terraform
terraform destroy -var yc_folder=$YC_FOLDER -var yc_token=$YC_TOKEN -var user=$USER
yc managed-postgresql cluster list
```

## Удаление реестра и docker-образов
В консоли зайдите во вкладку `Container Registry`, выберите реестр `lab-registry` и удалите в нем все образы.
После этого вернитесь к списку реестров, нажмите на раскрывающееся меню для `lab-registry` и удалите реестр.

## Удаление ВМ с настроенным окружением 
В консоли зайдите во вкладку `Compute`, нажмите на раскрывающееся меню для ВМ `lab-vm` и удалите эту ВМ.
