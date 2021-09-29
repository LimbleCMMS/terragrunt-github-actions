FROM amazonlinux:2
RUN yum install -y git jq gcc curl unzip
RUN amazon-linux-extras enable python3.8
RUN yum install -y python3.8
RUN yum install -y python3-pip
RUN python3 -m pip install boto3

RUN python3 --version

RUN ln -sf python3.8 /usr/bin/python3

RUN curl --silent --location https://rpm.nodesource.com/setup_14.x | bash -
RUN yum -y install nodejs


COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]


# curl git jq openssh gcc libc-dev
