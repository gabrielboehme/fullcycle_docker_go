FROM golang:1.19.3-alpine AS builder

WORKDIR /app
COPY go.mod .
RUN go mod download
COPY *.go .
RUN go build -o hello_world
RUN ls

FROM golang:1.19.3-alpine
WORKDIR /app
COPY --from=builder /app/hello_world /app
RUN ls
CMD ["./hello_world"]