FROM golang:1.15.1-alpine AS builder
    ENV GO111MODULE=on
    RUN go get -u github.com/williambailey/pacproxy

FROM alpine:3.12.0
    USER 65534:65534
    COPY --from=builder /go/bin/pacproxy /usr/local/bin
