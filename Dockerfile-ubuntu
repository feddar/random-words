FROM ubuntu

COPY wrand.sh /

RUN apt update && \
    apt install -y --no-install-recommends wbritish && \
    rm -rf /var/lib/apt/lists* && \
    chmod +x /wrand.sh

CMD ["/wrand.sh"]
