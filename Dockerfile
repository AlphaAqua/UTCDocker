FROM python:3.8-alpine

RUN apk add --update --no-cache py3-numpy
ENV PYTHONPATH=/usr/lib/python3.8/site-packages

COPY requirements.txt /
WORKDIR /

RUN pip install -r requirements.txt


