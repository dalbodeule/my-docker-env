FROM linuxserver/openvscode-server:latest

ARG TZ=Asia/Seoul
ARG PUID=1000
ARG PGUID=1000
ARG DOCKER_GID=999

RUN ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo docker gid is ${DOCKER_GID} && \
    groupadd -g ${DOCKER_GID} docker && \
    apt update && apt dist-upgrade -y && \
    apt install zsh git gpg wget curl vim python3 htop golang npm -y && \
    npm i -g npm n && \
    n latest && \
    PATH="$PATH" && \
    chsh -s /usr/bin/zsh && \
    curl -sSL https://get.docker.com/ | sh && \
    usermod -aG docker abc
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    chsh -s /usr/bin/zsh

COPY --chown=abc:abc ./zshrc/code-server.zshrc /config/.zshrc
