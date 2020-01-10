FROM ubuntu

COPY wrand.sh /

RUN apt update && apt -y --no-install-recommends wbritish && chmod +x /wrand.sh

CMD ["/wrand.sh"]
