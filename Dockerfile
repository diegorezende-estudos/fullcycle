# Etapa 1: Build da aplicação
FROM golang:1.24.2-alpine3.21 AS builder
WORKDIR /usr/src/app
COPY . .
RUN go build -o /app/main .

# Etapa 2: Imagem final mínima
FROM scratch
COPY --from=builder /app /app
CMD ["/app/main"]
