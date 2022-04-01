FROM ubuntu:latest as stage0 
RUN apt-get update 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get  install  golang  -y
WORKDIR /tmp 
COPY main.go   /tmp/main.go 
RUN go build  main.go 

FROM golang:latest as stage1
WORKDIR /opt 
COPY --from=stage0 /tmp/main     main
CMD ["./main"]
