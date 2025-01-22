FROM ubuntu:22.04

ENV USER=user1
ENV HOME=/home/$USER

RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    software-properties-common \
    python3.10 \
    python3-pip \
    gnupg2 \
    ca-certificates \
    jq && \
    apt-get clean

RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv && \
    echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc && \
    ln -s ~/.tfenv/bin/* /usr/local/bin/

RUN git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv && \
    echo 'export PATH="$HOME/.tgenv/bin:$PATH"' >> ~/.bashrc && \
    ln -s ~/.tgenv/bin/* /usr/local/bin/

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh && \
    curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh
