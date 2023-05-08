---
created: 2023-05-08
---
## Инструкция

### Настройка хостовой системы

1. Загружаем репозиторий
```bash
wget -P /tmp/ https://github.com/wotomg/ddg-test/archive/refs/heads/main.zip
```
```bash
unzip /tmp/main.zip
```
```bash
cd ddg-test-main
```


2. На хостовой системе, с ОС Debian 10, нужно установить docker и docker-compose. Запускается с павами root.
```bash
su
```
```bash
apt update; apt install -y docker-compose docker
```

3. Запускаем docker, добавляем в автозагрузку
```bash
systemctl start docker.service
```
```bash
systemctl enable docker.service
```
проверяем
```bash
systemctl status docker.service
```

3. Добавляем пользователя в группу docker.
> [!IMPORTANT]
> Обязательно заменить username на имя пользователя, который будет работать с docker.
```bash
/sbin/usermod -aG docker username
```

4. Установка node_exporter на хостовую систему
```bash
bash install_node_exporter.sh
```

5. Проверяем, что node_exporter запущен и добавлен в автозагрузку
```bash
systemctl status node_exporter.service
```

6. Выходим из пользователя root
```bash
exit
```

### Разворачиваем контейнеры
1. Редактируем файлы c переменными mysql.env и grafana.env

2. Запускаем сборку контейнеров
```bash
docker-compose up -d
```
