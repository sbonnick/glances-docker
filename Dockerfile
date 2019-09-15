FROM python:3-alpine

RUN apk add py-pip python-dev linux-headers musl-dev lm_sensors wireless-tools \
    && pip install --upgrade pip \
    && pip install psutil bottle setuptools glances[action,batinfo,browser,cpuinfo,docker,export,folders,gpu,graph,ip,raid,snmp,web,wifi,hddtemp] \
    && pip install glances

VOLUME /glances
WORKDIR /glances

EXPOSE 61208
EXPOSE 61209

CMD python -m glances -C /glances/conf/glances.conf $GLANCES_OPT
