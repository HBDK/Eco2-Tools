FROM python:3.8
WORKDIR /app

RUN pip3 install 'git+https://github.com/keton/etrv2mqtt.git'
COPY ./run.sh .
RUN chmod +x run.sh

CMD ["/app/run.sh"]
