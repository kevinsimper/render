FROM golang:1.12 as builder

WORKDIR /app

ADD . .

RUN go build -ldflags "-X main.version=1.0.0" -o bin/render ./cmd/render



FROM golang:1.12

COPY --from=builder /app/bin/render /

ENTRYPOINT ["/render"]
