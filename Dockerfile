# Do your stuff, build a static binary
FROM golang:alpine as builder
WORKDIR /src/app
COPY . .

RUN CGO_ENABLED=0 go build -o /app src/app/main.go

# Copy binary from builder to itch
FROM builder
COPY --from=builder /app /app
ENTRYPOINT ["/app"]