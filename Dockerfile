FROM debian:bullseye-slim

RUN \
  apt-get update && \
  apt-get -y install ca-certificates && \
  apt-get clean

RUN groupadd -r w3sec && useradd --no-log-init -m -r -g w3sec w3sec

COPY w3sec /usr/bin/w3sec

USER w3sec

EXPOSE 8080

ENTRYPOINT ["w3sec"]
CMD ["--no-renderer-sandbox", "--listen", "0.0.0.0:8080"]
