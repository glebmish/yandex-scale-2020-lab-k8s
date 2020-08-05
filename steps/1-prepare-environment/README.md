# Подготовка окружения

## Настройка доступа по ssh
1. Убедитесь, что у вас есть ssh-ключ или сгенерируйте новый:
```
ssh-keygen -t rsa -b 2048 # генерация нового ssh-ключа
cat ~/.ssh/id_rsa.pub
```
Более подробная инструкция по ссылке: https://cloud.yandex.ru/docs/compute/operations/vm-connect/ssh#creating-ssh-keys

2. Создайте виртуальную машину в Консоли из образа `base-image`:
* В каталоге нажмите кнопку `Создать ресурс`, выберите ресурс `Виртуальная машина`, введите имя `lab-vm`;
`Удалять вместе с ВМ`, выберите наполнение из образа. Выберите образ `base-image`;
* В разделе `Доступ` введите логин для доступа к ВМ. Скопируйте SSH-ключ из файла `~/.ssh/id_rsa.pub`.

3. Дождитесь создания ВМ (должен быть статус `Running`);

4. Зайдите на созданную ВМ по ssh;

5. Дальнейшие команды будут выполняться на созданной ВМ.

## Настройка консольной утилиты yc для работы с Яндекс Облаком
1. Выполните в терминале `yc init`;
2. Перейдите по полученной ссылке вида `https://oauth.yandex.ru/authorize?response_type=token&client_id=1a...`; 
3. Полученную строку OAuth-token запишите, она нам потребуется несколько раз;
4. Используйте OAuth token в терминале для продолжения;
5. Выберите `cloud` и `folder`, выберите `compute zone` ru-central1-b;

6. Сохраните в переменные окружения значения `OAuth-token` и `folder`: 
```
export YC_FOLDER=$(yc config get folder-id)
export YC_TOKEN=$(yc config get token)

printenv YC_FOLDER
printenv YC_TOKEN

echo "export YC_FOLDER=$(yc config get folder-id)" >> ~/.bashrc
echo "export YC_TOKEN=$(yc config get token)" >> ~/.bashrc
```

7. Проверьте, что yc настроен корректно: выведите список виртуальных машин в каталоге с помощью `yc`:
```
yc compute instance list
```
