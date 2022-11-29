FROM golang:1.19.3-alpine AS builder

WORKDIR /app
COPY go.mod .
RUN go mod download
COPY *.go .
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o hello_world

FROM scratch
WORKDIR /app
COPY --from=builder /app/hello_world /app
CMD ["./hello_world"]