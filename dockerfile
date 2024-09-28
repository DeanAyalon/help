FROM alpine

WORKDIR /test
COPY *.* .

CMD [ "ls" ]