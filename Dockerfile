# --- Этап 1: сборка сайта ---
FROM docker.io/hugomods/hugo:latest AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

# --- Этап 2: раздача статики ---
FROM docker.io/nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
EXPOSE 80
