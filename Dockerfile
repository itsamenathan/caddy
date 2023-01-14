FROM caddy:2.6.2-builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security@v1.1.18 \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.6.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
