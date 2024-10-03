FROM alpine

RUN apk add docker

# RUN --mount=type=bind,target=/var/run/docker.sock,source=/var/run/docker.sock docker ps > ps

# Workaround from https://github.com/docker/buildx/issues/1991#issuecomment-1666560344
ENV DOCKER_HOST=tcp://host.docker.internal:2375 
ENV TESTCONTAINERS_HOST_OVERRIDE=host.docker.internal
RUN docker ps > ps

CMD cat ps