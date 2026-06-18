## Домашнее задание к занятию «Настройка приложений и управление доступом в Kubernetes»

Выполнения задания продолжаю на тестовом стенде развернутом в Yandex cloud из репозитория: https://github.com/aleksey-dubrovin/yandex-k8s.git. 
Управление кластером microk8s выполнятеся с локальной машины через API по token, допонительно развернут dashboard для визаульного отображения объектов.
Для проверки манифестов и конфигурации, установлен плагин Kubernetes в Visual Studio Code.

Перед началом выполняю удаление объектов из предыдущих заданий:
```bash
kubectl delete pods,deployments,services,ingress --all

kubectl get all
```

### Задание 1: Работа с ConfigMaps.

Создаю и применяю манифест Deployment с двумя контейнерами (nginx и multitool), подключаю к нему веб-страницу через ConfigMap:

![alt text](image.png)
---
![alt text](image-1.png)
---

*Для веб-страницы логичнее использовать том, смонтировав её в нужную директорию nginx. По умолчанию nginx ищет статические файлы в директории /usr/share/nginx/html.*

Настраиваю проброс портов на ноде port-forward deployment/web-app 8080:80 и проверяю доступность web страницы:

![alt text](image-2.png)
---

### Задание 2: Настройка HTTPS с Secrets.

Генерирую самоподписанный SSL-сертификат, создаю из него Secret:

![alt text](image-3.png)
---

Создаю и применяю манифест Ingress для доступа к приложению по HTTPS:

![alt text](image-5.png)
---

Проеряю доступность web-app через ingress controller traefik:

![alt text](image-6.png)
---

Создаю и применяю манифест Service для доступа к web-app, пересоздаю ingress под:

![alt text](image-7.png)
---

Проверяю доступность web-app через ingress controller traefik:

![alt text](image-8.png)
---
![alt text](image-10.png)
---

* Для корректного отображения текста, исправляю манифест ConfigMap. Нужно добавить строку <meta charset="UTF-8"> в раздел <head>.*

![alt text](image-11.png)
---

### Задание 3: Настройка RBAC.

Включаю компонент rbac и готовлю сертификат для пользователя:

![alt text](image-12.png)
---
![alt text](image-13.png)
---

Создаю и применяю манифесты Role, RoleBinding с для пользователя developer.

![alt text](image-14.png)
---

Создаю контекст для кластера с доступом пользователя, переключаюсь в новый контекст developer:

![alt text](image-15.png)
---

Проверяю доступ к администрированию под новым контекстом:

![alt text](image-16.png)
---
![alt text](image-17.png)
---