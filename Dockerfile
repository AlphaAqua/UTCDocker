FROM node:10-alpine

RUN apk add --no-cache --virtual .pipeline-deps readline linux-pam \
  && apk add bash sudo shadow \
  && apk del .pipeline-deps

LABEL "com.azure.dev.pipelines.agent.handler.node.path"="/usr/local/bin/node"

# Install python with numpy
RUN apk add --update --no-cache python3
RUN apk add --update --no-cache py3-numpy
ENV PYTHONPATH=/usr/lib/python3.8/site-packages

RUN apk add --update --no-cache py3-pip
COPY requirements.txt /
RUN pip3 install -r requirements.txt

CMD [ "node" ]
