FROM ubuntu:20.04

RUN ["/bin/sh", "-c", "apt-get install bash ca-certificates curl git jq openssh gcc libc-dev"]
RUN ln -sf python3 /usr/bin/python
RUN ln -sf python3.8 /usr/bin/python

# Install more deps
RUN apt-get update \
    && apt-get install build-deps python3-dev musl-dev \
    && apt-get install jpeg-dev zlib-dev libjpeg \
    && pip install Pillow \
    && pip install pycryptodomex 

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
