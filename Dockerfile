FROM python:3.8-alpine

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh gcc libc-dev build-deps python3-dev musl-dev zlib-dev"]
# Install python/pip
# ENV PYTHONUNBUFFERED=1
RUN ln -sf python3 /usr/bin/python
RUN ln -sf python3.8 /usr/bin/python

# Required by some python modules
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade Pillow
# RUN apk add --update --no-cache python3.8-full && ln -sf python3.8 /usr/bin/python
# RUN ln -sf python3.8 /usr/bin/python
# RUN python3 -m ensurepip
# RUN pip3 install --no-cache --upgrade pip setuptools

# alias python 3.8 to python3, this is required by our configuration
# RUN echo "alias python3.8=python3" >> ~/.bash_aliases
# RUN which python3.8

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
