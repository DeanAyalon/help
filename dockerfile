FROM alpine

RUN --mount=type=bind,target=/var/run/docker.sock,source=/var/run/docker.sock docker ps > ps

CMD cat ps