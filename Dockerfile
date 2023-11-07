FROM golang:1.21.3

WORKDIR /src
COPY . .
RUN go build -o main

EXPOSE 8080
CMD ["./main"]