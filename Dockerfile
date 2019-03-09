FROM gliderlabs/alpine:3.8

RUN apk-install python3 python3-dev build-base \
 && python3 -m ensurepip

WORKDIR /app
COPY . /app

RUN mkdir -p /config \
 && touch /config/config.py \
 && ln -sf /config/config.py /app/config.py \
 && touch /config/server.pem \
 && ln -sf /config/server.pem /app/server.pem \
 && touch /config/server.cert \
 && ln -sf /config/server.cert /app/server.cert

EXPOSE 8338
VOLUME /config
CMD ["/usr/bin/python3", "main.py"]