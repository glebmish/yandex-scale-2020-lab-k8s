# Разворачивание приложения и Load Balancer в k8s
1. Посмотрите файлы конфигурации:
```
cd $REPO/k8s-files
cat lab-demo.yaml.tpl
cat load-balancer.yaml
```

2. В файле `lab-demo.yaml.tpl` замените значение переменных:
Переменные `DATABASE_URI` и `DATABASE_HOSTS` получены в результате работы terraform на четвертом шаге.
`REGISTRY_ID` получали ранее с помощью команды `yc container registry list`.
```
envsubst \$REGISTRY_ID,\$DATABASE_URI,\$DATABASE_HOSTS <lab-demo.yaml.tpl > lab-demo.yaml
```

4. Разверните ресурсы:
```
kubectl apply -f lab-demo.yaml
kubectl describe deployment lab-demo
```

```
kubectl apply -f load-balancer.yaml
kubectl describe service lab-demo
```

5. Как только `service load-balancer` полноценно развернется и получит внешний URL (поле `LoadBalancer Ingress`),
проверим работоспособность сервиса в браузере.
