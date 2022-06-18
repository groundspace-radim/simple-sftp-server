FROM debian:bullseye-slim

LABEL org.opencontainers.image.authors="Radim Badsi <radim@groundspace.io>"

RUN useradd -m -u 1001 user

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update && \
    apt-get install -y openssh-server tini && \
    apt-get clean && \
    mkdir -p /run/sshd

COPY sshd_config /etc/ssh/

ENTRYPOINT ["/usr/bin/tini", "--"] # Handle signals
CMD ["/usr/sbin/sshd", "-D", "-e"]
