FROM python:3.8-alpine

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh gcc libc-dev"]
RUN ln -sf python3 /usr/bin/python
RUN ln -sf python3.8 /usr/bin/python

# Install more deps
RUN apk update \
    && apk add --virtual build-deps python3-dev musl-dev \
    && apk add jpeg-dev zlib-dev libjpeg \
    && pip install Pillow \
    && apk del build-deps

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
