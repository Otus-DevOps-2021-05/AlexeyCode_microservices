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
