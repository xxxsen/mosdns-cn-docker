FROM golang:1.17

ARG BUILD_TAG=

RUN git clone https://github.com/IrineSistiana/mosdns-cn.git --depth=1
WORKDIR mosdns-cn
RUN CGO_ENABLED=0 go build -a -tags netgo -ldflags '-w' -o mosdns-cn

FROM alpine:3.12
RUN apk --no-cache add ca-certificates
COPY --from=0 /go/mosdns-cn/mosdns-cn /bin/
ENTRYPOINT ["/bin/mosdns-cn"]
