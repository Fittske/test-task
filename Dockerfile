# Базовый образ
FROM python:latest

# Определяем рабочую директорию контейнера
WORKDIR /python

# Копируем файл с необходимыми компонентами в созданную директорию
COPY /python/requirements.txt /python

# Обновляем pip и устанавливаем компоненты
RUN pip install --upgrade pip && python -m pip install -r requirements.txt

# Указываем Docker порт для прослушивания (tcp)
EXPOSE 8080

# Копируем наше приложение внутрь контейнера
COPY ./python /python

# Определяем команду с аргументами, которую нужно выполнить когда контейнер будет запущен
CMD ["python", "/python/app.py"]