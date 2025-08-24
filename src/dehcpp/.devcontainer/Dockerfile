FROM ghcr.io/jakoch/cpp-devbox:trixie-latest

LABEL maintainer="dehrexd@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "PACKAGES" && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
    gcc g++ \
    clangd clang clang-tidy \
    valgrind gdb \
    ccache

RUN echo "CLEANUP" && \
    apt-get autoremove -y && \
    apt-get clean autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV DEBIAN_FRONTEND=dialog