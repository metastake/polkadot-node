FROM debian:stable-slim

LABEL org.opencontainers.image.source  = "https://github.com/metastake/polkadot-node"
LABEL org.opencontainers.image.authors = "team@metastake.cc"

ARG PROG_NAME

COPY ${PROG_NAME} /usr/local/bin/polkadot

RUN useradd -m -u 1000 -U -s /bin/bash -d /polkadot polkadot && \
  mkdir -p /polkadot/.local/share && \
  mkdir /data && chown -R polkadot:polkadot /data && \
  ln -s /data /polkadot/.local/share/polkadot && \
  rm -rf /usr/bin /usr/sbin

USER polkadot
EXPOSE 30333 9933 9944 9615
VOLUME [ "/data" ]

ENTRYPOINT [ "polkadot" ]