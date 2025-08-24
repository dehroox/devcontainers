FROM debian:trixie-slim AS downloader

LABEL maintainer="dehrexd@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "PACKAGES" && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
    gnupg2 ca-certificates \
    build-essential \
    wget git nano \
    linux-perf \
    gcovr lcov \
    make zip sudo \
    openssh-server tar curl unzip pkg-config bash-completion \
    locales \
    zsh \   
    starship


SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo "GITHUB CLI" && \
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
    chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
    apt-get update && apt-get install --no-install-recommends --assume-yes \
    gh && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo "Create the user" && \
    groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    echo "Add sudo support" && \
    echo $USERNAME ALL=\(root\) ALL:ALL > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME


RUN echo "CLEANUP" && \
    apt-get autoremove -y && \
    apt-get clean autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV SHELL=/bin/zsh

ENV TZ=Asia/Manila

RUN echo "Locale & Timezone" && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale && \
    dpkg-reconfigure -f noninteractive locales && \
    update-locale LANG=en_US.UTF-8 && \
    echo "export PATH=$PATH" > /etc/environment && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8


ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    DEBIAN_FRONTEND=dialog