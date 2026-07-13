## Домашнее задание к занятию «Установка Kubernetes».

Установить кластер K8s.

### Задание 1. Установить кластер k8s с 1 master node.

Для подготовки нод кластера использую IaC terraform с настроенным сценарием cloud-init в Yandex Cloud.

Репозиторий с описанием решения по адресу: https://github.com/aleksey-dubrovin/yandex-k8s-ha.git.

![alt text](image-1.png)
---
Подключаюсь по ssh к мастер-ноде и проверяю настройку зависимостей:

![alt text](image.png)
---
Выполняю создание кластера по [Инструкции по установке kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/).

![alt text](image-2.png)
---
Фиксирую строку подключения для воркер-нод в кластер:

![alt text](image-3.png)
---
Копирую конфигурацию для текущего пользователя:

![alt text](image-4.png)
---
Устанавливаю сетевой плагин Calico и переключаю на режим VXLAN (vxlanMode: Always) так как ноды в разных зонах доступности:

![alt text](image-5.png)
---
Делаю простой скрипт с циклом подключения каждой воркер-ноды к кластеру:

![alt text](image-6.png)
---
Проверяю статус узлов кластера:

![alt text](image-7.png)
---
Выполняю тестирование работы клaстера и сетевого плагина:

![alt text](image-8.png)
---
Устанавливаю Metrics Server, создаю конфигурацию Horizontal Pod Autoscaler (HPA) для нагрузочного тестирования и добавляю resources.requests в Deployment nginx:

![alt text](image-9.png)
---
Запускаю поды для нагрузочного тестирования и проверяю механизм автоматического развертывания реплики при превышении порога:

![alt text](image-10.png)
---
![alt text](image-11.png)
---
![alt text](image-12.png)
---
![alt text](image-13.png)
---
Кластер из 5 нод (1 мастер, 4 воркера) развернут успешно, поды взаимодействуют между собой на разных нодах в разных зонах доступности.

### Задание 2. Установить кластер k8s с 1 master node.

Для расширения кластера до отказоустойчивого использую решение [kubespray](https://kubespray.io/) по инструкции используя playbook scale.yml с версией v2.25.0. Использую terraform для генерации инвентори файла по шаблону.


