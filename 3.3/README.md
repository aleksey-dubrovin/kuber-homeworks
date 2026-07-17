## Домашнее задание к занятию «Как работает сеть в K8s».

Настроить сетевую политику доступа к подам.

### Задание 1. Создать сетевую политику или несколько политик для обеспечения доступа.

Подготавливаю тестовый стенд в Yandex cloud из собственного репозитория: https://github.com/aleksey-dubrovin/yandex-k8s.git.

Перед началом выполняю проверку инстанса на соответствие требованиям:

![alt text](image.png)
---
Фиксирую настройки ip и iptables ноды:

![alt text](image-1.png)
---
![alt text](image-2.png)
---
![alt text](image-3.png)
---
Устанавливаю утилиту диагностики calicoctl соответствующей версий и проверяю настройки:

![alt text](image-4.png)
---

Применяю манифест deployments.yaml с описанием Deployment и Services для frontend, backend, cache в неймспейсе App. Все используют образ wbitt/network-multitool.

![alt text](image-5.png)
---
Получаю ошибку, испраляю на нижний регистр и применяю заново:

![alt text](image-10.png)
---
Применяю манифест policies.yaml с описанием NetworkPolicy и проверяю результат в namespace app:

![alt text](image-6.png)
---
Проверяю доступность сервисов и параллельно запускаю tcpdump на принимающем поде:

![alt text](image-7.png)
---

Проверяю доступность сервисов и параллельно запускаю tcpdump на принимающем поде:

![alt text](image-8.png)
---
Проверяю созданные политики через calicoctl:

![alt text](image-11.png)
---
Удаляю стандартные Kubernetes NetworkPolicy и проверяю результат:

![alt text](image-12.png)
---
Настраиваю Calico NetworkPolicy через манифест calico-policies.yaml:

![alt text](image-13.png)
---
Проверяю результат при отсутствующих Kubernetes NetworkPolicy:

![alt text](image-15.png)
---
Логи Calico подтверждают, что политики активны и применены к подам:

![alt text](image-14.png)
---
