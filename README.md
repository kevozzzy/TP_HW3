# TP_HW3

Проект генерирует CSV с данными о товарах и создаёт HTML-отчёт.
Генератор и аналитик работают в разных Docker-контейнерах.

## Запуск

Все команды нужно выполнять из корня репозитория.

```bash
./run.sh build_generator
./run.sh run_generator
./run.sh build_reporter
./run.sh run_reporter
```

Результаты появятся в папке `data`:

- `data.csv` — сгенерированные данные;
- `report.html` — HTML-отчёт.

## Остальные команды

```bash
./run.sh create_local_data
./run.sh structure
./run.sh clear_data
./run.sh inside_generator
./run.sh inside_reporter
```

## Отчёт в GitHub Codespaces

Запустите:

```bash
./run.sh report_server
```

Затем откройте вкладку Ports, найдите порт `8080` и нажмите
Open in Browser. Если требуется, добавьте к адресу `/report.html`.

Путь до отчёта:

```text
браузер → порт 8080 Codespace → порт 80 контейнера nginx → report.html
```