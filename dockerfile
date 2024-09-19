# syntax=docker/dockerfile:1.7-labs
FROM alpine

WORKDIR /test

COPY --exclude=**/.venv . .