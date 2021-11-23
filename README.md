# AlexeyCode_microservices
AlexeyCode microservices repository

#ДЗ№14

Выполнено основное задание
- Написан Dockerfile c монолитом приложения otus-reddit
- в файле  ```docker-1.log``` описана разница между контейнером и образом, а так же логи команды docker image

Выполнено дополнительное задание
- написан шаблон для packer который запекает образ с предустановленным docker
- написаны скрипты terraform которые поднимают количество VM которое заданов переменной  ```count```
- написан terraform template который формирует inventory для ansible
- написаны скрипты для ansible которые устанавливают docker и запускают приложение otus-reddit на нем

#ДЗ№15
- написаны Dockerfile для модулей post, comment, ui
- оптимизировн Dockerfile для модуля ui

#ДЗ№22
Ссылки на образы
docker.io/devopstank/comment
docker.io/devopstank/ui
docker.io/devopstank/post
docker.io/devopstank/prometheus
docker.io/devopstank/blackbox_exporter

#ДЗ№25
- В docker-compose.yml добавлено логирование fluentd и трейсинг zipkin
- Добавлен docker-compose-logging.yml для поднятия EFK стека
- Доработан Makefile для сборки fluend
