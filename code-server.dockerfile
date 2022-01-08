FROM linuxserver/code-server:latest

ENV TZ=Asia/Seoul
ENV PUID=1000
ENV PGUID=1000

RUN ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    apt update && apt dist-upgrade -y && \
    apt install zsh git gpg wget curl vim python3 htop -y && \
    npm i -g npm && \
    PATH="$PATH" && \
    chsh -s /usr/bin/zsh && \
    curl -sSL https://get.docker.com/ | sh && \
    usermod -aG docker abc
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    chsh -s /usr/bin/zsh

COPY --chown=abc:abc ./zshrc/code-server.zshrc /config/.zshrc