FROM golang:alpine AS builder

RUN apk add --no-cache upx

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o hello .

RUN upx --best --lzma hello

FROM scratch

COPY --from=builder /app/hello /hello

ENTRYPOINT ["/hello"]