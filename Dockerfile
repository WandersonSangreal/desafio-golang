FROM golang:alpine AS builder

WORKDIR /go/src
COPY go/src/app.go /go/src
RUN go build /go/src/app.go

FROM scratch

WORKDIR /go/src

COPY --from=builder /go/src/app /go/src/app

ENTRYPOINT ["/go/src/app"]