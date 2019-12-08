FROM python:3-alpine

ARG user
ARG uid

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

RUN apk add --no-cache gcc libressl-dev openssh gnupg
RUN pip install --upgrade pip
RUN pip install salt-ssh && rm -rf ${HOME}/.cache

RUN adduser -D ${user:-lot} -u ${uid:-501}
USER ${user:-lot}
WORKDIR /home/${user:-lot}
