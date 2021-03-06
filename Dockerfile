# build: docker build -t generalmeow/deluge:<TAG>
# run: docker run -d -p 8112:8112 --name deluge -v <>:/root/deluge generalmeow/deluge:<TAG>
FROM ubuntu:latest
MAINTAINER Paul Hoang 2018-07-28
EXPOSE 8112
RUN ["apt", "update"]
RUN ["apt", "install", "deluged", "deluge-web", "-qy"]
RUN ["mkdir", "-p", "/root/deluge/incomplete"]
RUN ["mkdir", "-p", "/root/deluge/complete"]
RUN ["mkdir", "-p", "/root/deluge/torrents"]
RUN ["mkdir", "-p", "/root/deluge/autoadd"]
VOLUME ["/root/deluge"]

RUN ["mkdir", "-p", "/root/.config/deluge"]
ADD ["./files/root/.config/deluge/core.conf", "/root/.config/deluge"]
CMD ["deluge-web"]
