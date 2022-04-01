FROM ubuntu:latest as stage0 
RUN apt-get update 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get  install  golang  -y 
COPY main.go   /tmp/main.go 
RUN go build  main.go 

FROM golang:latest as stage1
COPY --from=stage0  /main     /opt/main
CMD ["/opt/main"]
