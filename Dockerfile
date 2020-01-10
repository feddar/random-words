FROM ubuntu

COPY wrand.sh /

RUN apt update && apt install -y --no-install-recommends wbritish && chmod +x /wrand.sh

CMD ["/wrand.sh"]
