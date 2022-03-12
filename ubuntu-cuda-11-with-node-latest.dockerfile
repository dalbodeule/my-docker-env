FROM nvidia/cuda:11.4.2-cudnn8-devel-ubuntu20.04

ARG TZ=Asia/Seoul
WORKDIR /home/abc/workspace

RUN ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    apt update && apt dist-upgrade -y && \
    apt install sudo zsh git gpg curl wget npm vim screen python3 htop -y && \
    npm i -g n
RUN npm i -g npm yarn && \
    chsh -s /usr/bin/zsh && \
    groupadd -g 1000 abc && \
    useradd --uid 1000 --gid 1000 --shell /usr/bin/zsh --create-home abc && \
    usermod -a -G sudo abc && \
    mkdir -p /home/abc/workspace && \
    chown abc:abc /home/abc && \
    echo "abc:abc" | chpasswd && \
    n latest && \
    PATH="$PATH" && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    su abc sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY --chown=root:root ./zshrc/ubuntu.zshrc /root/.zshrc
COPY --chown=abc:abc ./zshrc/ubuntu.zshrc /home/abc/.zshrc

USER abc:abc

ENTRYPOINT ["tail", "-f", "/dev/null"]