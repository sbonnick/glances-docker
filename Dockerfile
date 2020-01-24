FROM alpine:edge


RUN apk update \
    && apk add --update gcc libc-dev py3-pip python3 python3-dev linux-headers musl-dev lm_sensors wireless-tools build-base libzmq zeromq-dev \
    && pip3 install pyzmq psutil bottle glances[action,batinfo,browser,cpuinfo,docker,export,folders,gpu,graph,ip,raid,snmp,web,wifi,hddtemp] \
    && apk del build-base musl-dev python3-dev zeromq-dev gcc libc-dev \
    && rm -rf /var/cache/apk/*

VOLUME /glances
WORKDIR /glances

EXPOSE 61208
EXPOSE 61209

CMD python -m glances -C /glances/conf/glances.conf $GLANCES_OPT
