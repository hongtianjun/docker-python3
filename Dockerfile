#
FROM python:3.7.0-alpine3.8
LABEL maintainer="https://github.com/hongtianjun/"


RUN apk update && apk add --no-cache \
        libuuid \
        pcre \
        mailcap \
        gcc \
        libc-dev \
        linux-headers \
        pcre-dev \
        libffi-dev \
		mariadb-dev \
	&& pip install --no-cache-dir -U django djangorestframework Flask requests mysqlclient six \
    && rm -rf /tmp/*
    
CMD ["python"]
