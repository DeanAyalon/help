# Build image
FROM python:3.11-alpine3.19 AS build

# Other instructions...

ARG PACKAGES='\
   g++ make python3-dev \
    libffi-dev \
'

RUN echo "Install system packages" && \
    apk add --no-cache $PACKAGES

# Production image
FROM python:3.11-alpine3.19

ARG RUNTIME_PACKAGES='\
    dumb-init \
'

RUN echo "Install runtime packages" && \
    apk update && \
    apk add --no-cache $RUNTIME_PACKAGES