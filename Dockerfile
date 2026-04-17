# Reproducible dev image: Python (uv), OpenJDK, Quarto CLI.
# Bump QUARTO_VERSION / JAVA_MAJOR here; Python minor is the devcontainers image tag
# (pin the image by digest in devcontainer.json for stricter reproducibility).

ARG QUARTO_VERSION=1.9.36
ARG JAVA_MAJOR=21

FROM mcr.microsoft.com/devcontainers/python:1-3.12-bookworm

ARG JAVA_MAJOR
ARG QUARTO_VERSION

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git \
        openjdk-${JAVA_MAJOR}-jdk-headless \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sfn "$(dirname "$(dirname "$(readlink -f /usr/bin/javac))")" /opt/java-home
ENV JAVA_HOME=/opt/java-home
ENV PATH="${JAVA_HOME}/bin:${PATH}"

RUN ARCH="$(dpkg --print-architecture)" \
    && curl -fsSL -o /tmp/quarto.deb \
        "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-${ARCH}.deb" \
    && apt-get update \
    && apt-get install -y --no-install-recommends /tmp/quarto.deb \
    && rm -f /tmp/quarto.deb \
    && rm -rf /var/lib/apt/lists/*

USER vscode

RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

ENV PATH="/home/vscode/.local/bin:${PATH}"

WORKDIR /workspaces/leetcode_archive
