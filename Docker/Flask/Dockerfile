FROM python:3

WORKDIR /app

COPY web.py /app
COPY web.conf /app/conf

RUN pip install Flask Psycopg2 ConfigParser

ENV FLASK_APP=web.py

CMD ["flask", "run"]
