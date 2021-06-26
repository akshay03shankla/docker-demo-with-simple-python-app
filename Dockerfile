FROM python:2.7
RUN mkdir -p /usr/src/app
WORKDIR /use/src/app
COPY requirement.txt /usr/src/app
RUN pip install  --no-cache-dir -r requirement.txt
COPY . /usr/src/app
ENV PORT 8080 
EXPOSE $PORT
VOLUME [ "/app-data" ]
CMD gunicorn -b - :$PORT -c gunicorn.conf.py main:app