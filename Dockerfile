# сборка
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
# сборка
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/server ./main.go

# запуск
FROM alpine:3.19
WORKDIR /root/
COPY --from=builder /app/server .
EXPOSE 8080
# Не root для безопасности
RUN adduser -D -g '' appuser && chown appuser /root/server
USER appuser
CMD ["./server"]