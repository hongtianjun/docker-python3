#
FROM python:3.7.7-alpine3.11
LABEL maintainer="https://github.com/hongtianjun/"


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk update && apk add --no-cache \
        libuuid \
        pcre \
        mailcap \
        gcc \
        libc-dev \
        linux-headers \
        pcre-dev \
        libffi-dev \
        mariadb-dev \
    && pip install --no-cache-dir -U django djangorestframework Flask requests mysqlclient six gunicorn gevent supervisor -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/src \
    && rm -rf /tmp/*

ADD supervisord.conf /etc/supervisor/supervisord.conf
    
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
