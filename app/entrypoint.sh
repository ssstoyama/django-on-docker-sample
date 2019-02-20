#!/bin/sh

if [ $DATABASE = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -zv $SQL_HOST $SQL_PORT
    do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

python manage.py flush --no-input
python manage.py makemigrations myapp
python manage.py migrate
python manage.py collectstatic --no-input

exec "$@"
