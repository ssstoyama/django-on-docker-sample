FROM python:3.7-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src/app

COPY requirements.txt .

RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev shadow \
    && apk add postgresql-dev \
    && pip install -r requirements.txt --no-cache-dir

COPY . /usr/src/app/

ENV SECRET_KEY=your_sercret_key
ENV SQL_ENGINE=django.db.backends.postgresql
ENV SQL_DATABASE=django-db
ENV SQL_USER=django-user
ENV SQL_PASSWORD=password
ENV SQL_HOST=db
ENV SQL_PORT=5432
ENV DATABASE=postgres

RUN python manage.py collectstatic --no-input \
    && useradd django \
    && usermod -aG django django \
    && chown -R django:django /usr/src/app/ \
    && apk del build-deps

USER django

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
