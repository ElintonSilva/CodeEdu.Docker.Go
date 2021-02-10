FROM golang as Build
WORKDIR /app
COPY hello.go .
RUN go build hello.go
FROM scratch
COPY --from=Build /app/hello .
CMD ["./hello"]