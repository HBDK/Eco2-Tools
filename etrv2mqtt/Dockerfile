FROM python:3.8
WORKDIR /app

RUN pip3 install 'git+https://github.com/keton/etrv2mqtt.git'

CMD [ "etrv2mqtt", "/data/options.json" ]
