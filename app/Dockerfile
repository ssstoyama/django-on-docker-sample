FROM python:3.7-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src/app

COPY requirements.txt .

RUN apk update \
 && apk add --no-cache --virtual build-deps gcc python3-dev musl-dev shadow \
 && apk add postgresql-dev \
 && useradd django \
 && usermod -aG django django \
 && pip install -r requirements.txt --no-cache-dir \
 && apk del build-deps

COPY --chown=django:django . /usr/src/app/

USER django

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
