FROM node:20

WORKDIR /src

ENV NODE_ENV=development

RUN \
    apt-get update && \
    apt-get -y install apt-utils && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get -y install curl wget git sudo vim

RUN useradd -m builder && \
    usermod --shell /bin/bash builder && \
    usermod -aG sudo builder && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/builder && \
    chmod 0440 /etc/sudoers.d/builder && \
    sed -i "s|^#force_color_prompt=.*|force_color_prompt=yes|" /home/builder/.bashrc && \
    echo "export PATH=/home/builder/.npm-global/bin:\$PATH" >> /home/builder/.bashrc

RUN wget -qO- https://get.pnpm.io/install.sh | ENV="/home/builder/.bashrc" SHELL="$(which bash)" bash -

# ...