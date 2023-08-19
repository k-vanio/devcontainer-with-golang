FROM golang:1.21-bullseye as builder

WORKDIR /app

COPY ./app ./

RUN CGO_ENABLED=0 GOOS=linux go build -o main cmd/main.go

FROM scratch

WORKDIR /app

COPY --from=builder /app ./

EXPOSE 3001

CMD [ "./main" ]