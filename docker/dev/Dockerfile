FROM python:3.6-alpine

RUN apk update && apk upgrade \
    && apk add zsh \
    && rm -rf /var/cache/apk/*

ONBUILD ADD app /app/
WORKDIR /app