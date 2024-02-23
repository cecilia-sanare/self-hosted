FROM debian:stable-slim
WORKDIR /altserver
RUN apt update && apt install -y curl libavahi-compat-libdnssd-dev
ARG NETMUXD_VERSION=v0.1.4
RUN curl -L https://github.com/jkcoxson/netmuxd/releases/download/${NETMUXD_VERSION}/x86_64-linux-netmuxd > netmuxd
ARG ALTSERVER_VERSION=v0.0.5
RUN curl -L https://github.com/NyaMisty/AltServer-Linux/releases/download/${ALTSERVER_VERSION}/AltServer-x86_64 > ./AltServer
RUN chmod +x ./AltServer
ENTRYPOINT ["./AltServer"]