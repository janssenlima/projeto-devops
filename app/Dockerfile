FROM python:alpine

LABEL org.opencontainers.image.authors="janssenreislima@gmail.com"

WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY app.py .
COPY start.sh .
RUN apk --no-cache add curl && rm -rf /var/cache/apk/*

EXPOSE 5000

RUN chmod +x start.sh
CMD ./start.sh
