FROM ubuntu AS builder

RUN apt update && apt install -y --no-install-recommends witalian && rm -rf /var/lib/apt/lists* && \
    cat /usr/share/dict/italian | grep -P "^[\x{0061}-\x{007A}]+$" > /words

FROM alpine

COPY --from=builder /words /

COPY wrand.sh /

RUN chmod +x /wrand.sh 

CMD ["/wrand.sh"]
