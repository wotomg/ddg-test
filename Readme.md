---
created: 2023-05-08
---
## Инструкция

### Настройка хостовой системы

1. На хостовой системе, с ОС Debian 10, нужно установить docker и docker-compose. Запускается с павами root.
```bash
su
```
```bash
apt update; apt install -y docker-compose docker
```

2. Добавляем пользователя в группу docker.
> [!IMPORTANT]
> Обязательно заменить username на имя пользователя, который будет работать с docker.
```bash
usermod -aG docker username
```

3. Загружаем репозиторий
```bash
wget -P /tmp/ https://github.com/wotomg/ddg-test/archive/refs/heads/main.zip
```
```bash
unzip /tmp/main.zip
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
```bash
docker-compose up -d
```
