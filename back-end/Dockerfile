FROM golang:1.21
WORKDIR /app
COPY main.go .
RUN go build -o go-api
CMD ["./go-api"]