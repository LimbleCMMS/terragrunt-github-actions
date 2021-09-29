FROM amazonlinux:2
RUN yum install -y python3 python3-pip git jq gcc curl unzip
RUN python3 -m pip install boto3 pandas s3fs

RUN python3 --version

RUN ln -sf python3.8 /usr/bin/python3


COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]


# curl git jq openssh gcc libc-dev