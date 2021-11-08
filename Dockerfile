ARG FEDORA_VERSION
FROM registry.fedoraproject.org/fedora-toolbox:$FEDORA_VERSION

ARG BUILD_DATE
ARG VCS_REF
LABEL authoritative-source-url=quay.io \
      build-date="$BUILD_DATE" \
      maintainer="Owen Taylor <otaylor@fishsoup.net>" \
      name=owtaylor/rustup-toolbox \
      summary="Toolbox container based on Fedora with rustup" \
      url="https://github.com/owtaylor/rustup-toolbox/" \
      usage="This image is meant to be used with the toolbox command" \
      vcs-ref="$VCS_REF" \
      vcs-url="https://github.com/owtaylor/rustup-toolbox/"

RUN dnf -y update && \
    dnf -y install gcc && \
    dnf clean all

RUN mkdir /cargo && mkdir /rustup

ENV CARGO_HOME=/cargo \
    RUSTUP_HOME=/rustup \
    PATH=/cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN curl -o /tmp/rustup-init https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init && \
    chmod 0755 /tmp/rustup-init && \
    /tmp/rustup-init -y --no-modify-path && \
    rm -f /tmp/rustup-init

RUN chgrp -R wheel /cargo /rustup && \
    chmod -R g=u /cargo /rustup

