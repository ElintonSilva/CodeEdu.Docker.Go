FROM golang:alpine as Build
WORKDIR /app
COPY hello.go .
RUN go build -ldflags "-s -w" hello.go
FROM scratch
COPY --from=Build /app/hello .
CMD ["./hello"]