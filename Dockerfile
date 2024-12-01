# Базовий образ з Python 3.13
FROM python:3.13-slim

# Встановимо змінну середовища для домашньої директорії
ENV APP_HOME=/app

# Встановимо робочу директорію всередині контейнера
WORKDIR $APP_HOME

# Копіюємо pyproject.toml і poetry.lock
COPY pyproject.toml $APP_HOME/pyproject.toml
COPY poetry.lock $APP_HOME/poetry.lock

# Встановимо Poetry
RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --only main

# Копіюємо всі інші файли в контейнер
COPY . .

# Відкриваємо порт 3000 для HTTP сервера
EXPOSE 3000


# Запускаємо основний застосунок
CMD ["python", "main.py"]
