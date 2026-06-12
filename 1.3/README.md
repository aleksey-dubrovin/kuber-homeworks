## Домашнее задание к занятию «Запуск приложений в K8S»

Выполнения задания продолжаю на тестовом стенде развернутом в Yandex cloud из репозитория: https://github.com/aleksey-dubrovin/yandex-k8s.git. 
Управление кластером выполнятеся с локальной машины через API по token, допонительно развернут dashboard для визаульного отображения.

### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

Создаю манифест для Deployment из двух контейнеров и одним ReplicaSet.

![alt text](image.png)
---

Обращаюсь к событиям внутри контейнеров через dashboard:

![alt text](image-1.png)
---

При запуске контейнера multitool выдается ошибка:

![alt text](image-2.png)
---

Исправляю манифест и разношу контейнеры по портам, задаю переменную окружения для контейнера multitool

![alt text](image-3.png)
---

Выполняю горизонтальное масштабирование на развернутом Deployment

![alt text](image-5.png)
---

Создаю манифест для создания Service и доступа к Deployment web-app

![alt text](image-6.png)
---

Создаю и применяю манифест POD для проверки доступности Service

![alt text](image-7.png)
---

Подключаюсь к консоли POD и выполняю HTTP запрос на порты Service с названием web-service

![alt text](image-8.png)
---

Получаю ответ от nginx и multitool

![alt text](image-9.png)
---

### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

Создаю и применю манифест для Deployment состоящий из двух контейнеров с использованием initContainers.

![alt text](image-10.png)
---

Init контейнер поднялся и выполняет проверку.

![alt text](image-11.png)
---

Создаю и применяю манифест Service для создания зависимости Init контейнера

![alt text](image-12.png)
---

Проверка выполнения скрипта для Init контейнера на доступность Service test-service.

![alt text](image-14.png)
---

Проверка запуска Deployment

![alt text](image-15.png)
---

