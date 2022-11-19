FROM golang:latest

WORKDIR /APP
COPY . .
RUN go build
CMD ./docker_go