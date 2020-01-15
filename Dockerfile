FROM tiangolo/uwsgi-nginx-flask:python3.6

COPY . /app
WORKDIR /app

RUN pip install --trusted-host pypi.python.org -r requirements.txt

RUN ./setup.py install

EXPOSE 80
