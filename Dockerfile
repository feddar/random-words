FROM ubuntu AS builder

RUN apt update && apt install -y --no-install-recommends wbritish && rm -rf /var/lib/apt/lists* && \
    cat /usr/share/dict/british-english | grep -P "^[\x{0061}-\x{007A}]+$" > /words

FROM alpine

COPY --from=builder /words /

COPY wrand.sh /

RUN chmod +x /wrand.sh 

CMD ["/wrand.sh"]
