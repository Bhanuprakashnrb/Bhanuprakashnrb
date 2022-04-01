FROM ubuntu:latest as stage0 
RUN apt-get update 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get  install git golang  wget -y 
RUN git clone https://github.com/Bhanuprakashnrb/Bhanuprakashnrb.git
RUN go build Bhanuprakashnrb/main.go 

FROM golang:latest as stage1
COPY --from=stage0  /main     /opt/main
CMD ["/opt/main"]
