FROM python:3

RUN mkdir /srv/app/
RUN mkdir /srv/app/conf/

WORKDIR /srv/app/

COPY . /srv/app/

RUN pip install Flask psycopg2 configparser

EXPOSE 5000

CMD ["python3", "web.py"]


