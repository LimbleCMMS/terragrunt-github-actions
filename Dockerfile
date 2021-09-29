FROM scratch

ADD 1b09a7f9d9097edc0be3f0db9d9375f1d56721672e11a4be906a8d7942936b9c.tar.xz /
ADD 7eb4740fc74ab88553550b52328aa3df08db69faa493b9bcff5f9349bddd4dd3.tar.xz /
ADD 8bb3752fe19e57be84989c133502bba363d3815a8ef1422d3b069302b426355b.tar.xz /
ADD 9d3d5b67f6f0363d5fd782187eaf5f5f7bfc3e0e5e320025e06c0319f7f9336a.tar.xz /
ADD c9cecb68f02bb56f5c30f714b22e44e009273eec7c14250e8266eb440d7ca299.tar.xz /
ADD e48dfc7e587e10ffd672403cfbc02fa7a83f872b60a23a155588024e2e710a25.tar.xz /

ENV LANG=en_US.UTF-8
ENV TZ=:/etc/localtime
ENV PATH=/var/lang/bin:/usr/local/bin:/usr/bin/:/bin:/opt/bin
ENV LD_LIBRARY_PATH=/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib:/opt/lib
ENV LAMBDA_TASK_ROOT=/var/task
ENV LAMBDA_RUNTIME_DIR=/var/runtime

WORKDIR /var/task

ENTRYPOINT ["/lambda-entrypoint.sh"]
