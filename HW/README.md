# Docker HW — Стартап-аналитика

## Структура проекта

HW/
├── generator/        # Генератор CSV-данных (Python)
│   ├── Dockerfile
│   └── generate.py
├── reporter/         # Аналитик данных (Node.js)
│   ├── Dockerfile
│   ├── report.js
│   └── package.json
├── data/             # Сюда падают data.csv и report.html
├── local_data/       # Для локальной отладки
├── run.sh            # Главный скрипт
└── README.md

## Как запустить

./run.sh build_generator   # собрать образ генератора
./run.sh run_generator     # сгенерировать data/data.csv
./run.sh build_reporter    # собрать образ репортера
./run.sh run_reporter      # сгенерировать data/report.html

## Как открыть отчёт в браузере через GitHub Codespaces

1. Склонируй репозиторий и открой в GitHub Codespaces
2. Выполни команды выше чтобы сгенерировать данные
3. Запусти веб-сервер: ./run.sh report_server
4. Codespaces пробросит порт 8080 — появится уведомление, нажми "Открыть в браузере"
5. В адресе браузера добавь в конец /report.html

Цепочка: браузер → Codespaces (порт 8080) → контейнер nginx → data/report.html

## Все команды run.sh

./run.sh build_generator   # собрать образ генератора
./run.sh run_generator     # сгенерировать data/data.csv
./run.sh build_reporter    # собрать образ репортера
./run.sh run_reporter      # сгенерировать data/report.html
./run.sh structure         # структура файлов проекта
./run.sh clear_data        # очистить data/
./run.sh create_local_data # создать CSV локально без Docker
./run.sh inside_generator  # посмотреть /data изнутри контейнера генератора
./run.sh inside_reporter   # посмотреть /data изнутри контейнера репортера
./run.sh report_server     # запустить nginx на порту 8080
