# Estágio 1: Builder com otimizações extremas
FROM golang:1.24-alpine AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o main .

# Estágio 2: Imagem final minimalista
FROM scratch
COPY --from=builder /app/main /
CMD ["/main"]