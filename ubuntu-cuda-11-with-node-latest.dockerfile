FROM nvidia/cuda:11.4.2-cudnn8-devel-ubuntu20.04

ENV TZ=Asia/Seoul
WORKDIR /workspace
RUN ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && apt update && apt dist-upgrade -y && apt install git gpg wget npm vim screen python3 htop -y && npm i -g npm n && n latest && PATH="$PATH"

ENTRYPOINT ["tail", "-f", "/dev/null"]