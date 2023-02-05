FROM python:3

RUN mkdir /srv/app/
RUN mkdir /srv/app/conf/

WORKDIR /srv/app/

COPY . /srv/app/
COPY . /srv/app/conf/

RUN pip install Flask Psycopg2 ConfigParser
ENV FLASK_APP=web.py

EXPOSE 80

CMD ["flask", "run"]

