FROM golang:1.20-rc-alpine as builder

COPY greetings.go .

RUN go build -o /app greetings.go

FROM scratch

COPY --from=builder /app /app

ENTRYPOINT ["/app"]