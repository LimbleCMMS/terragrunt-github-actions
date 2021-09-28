FROM alpine:3

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh"]
# Install python/pip
ENV PYTHONUNBUFFERED=1
# RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN apk add --update --no-cache python3.8 && ln -sf python3.8 /usr/bin/python
# RUN ln -sf python3.8 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

# alias python 3.8 to python3, this is required by our configuration
# RUN echo "alias python3.8=python3" >> ~/.bash_aliases
# RUN which python3.8

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
