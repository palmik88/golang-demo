FROM golang:alpine as build
WORKDIR /opt/app
ADD . ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

FROM scratch
WORKDIR /opt/app
EXPOSE 9000
COPY --from=build /opt/app/docker-demo-2 .
CMD ["./docker-demo-2"]
