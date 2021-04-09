ARG FEDORA_VERSION=33
FROM registry.fedoraproject.org/f$FEDORA_VERSION/fedora-toolbox:$FEDORA_VERSION

RUN dnf -y update && \
    dnf -y install gcc && \
    dnf clean all
RUN mkdir /cargo && mkdir /rustup
ENV CARGO_HOME /cargo
ENV RUSTUP_HOME /rustup
ENV PATH /cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN curl -o /tmp/rustup-init https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init && chmod 0755 /tmp/rustup-init
RUN /tmp/rustup-init -y --no-modify-path
RUN rm -f /tmp/rustup-init

RUN chgrp -R wheel /cargo /rustup
RUN chmod -R g=u /cargo /rustup

