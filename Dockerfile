FROM golang:1.21-alpine as build

WORKDIR /usr/src

COPY main.go .

RUN go mod init github.com/gstsdev/docker-desafio-go && \
    go build main.go

FROM scratch

COPY --from=build /usr/src/main .

CMD ["./main"]