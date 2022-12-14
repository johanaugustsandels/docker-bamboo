FROM ubuntu:22.04
ENV PROMPT_COMMAND="history -a"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  curl nano libleveldb-dev

COPY --from=ghcr.io/bamboo-crypto/bamboo:06b8c90d734407c3948efdd55fe1ef006397bf64 /usr/local/bin/* /usr/local/bin/

WORKDIR /app
COPY app .
ENTRYPOINT [ "/app/entrypoint.sh" ]
