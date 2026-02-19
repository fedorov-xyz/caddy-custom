FROM caddy:2.10.2-builder AS builder

RUN xcaddy build \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/caddyserver/transform-encoder

FROM caddy:2.10.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
