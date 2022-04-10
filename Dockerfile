FROM golang:1.18.0-alpine AS builder

WORKDIR /usr/src/go
COPY app/ . 
RUN go run main.go
RUN go build main.go

FROM scratch

COPY --from=builder /usr/src/go/ /usr/src/go/
WORKDIR /usr/src/go

ENTRYPOINT [ "./main" ]
