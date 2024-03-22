FROM golang:alpine3.19 AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

ENV GO111MODULE=on
ENV GOCACHE=/root/.cache/go-build
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

RUN go build -ldflags="-w -s" -gcflags="all=-N -l" -tags production -trimpath -o /App

FROM scratch

WORKDIR /app

COPY --from=builder /App /App

EXPOSE 8081

CMD ["/App"]
