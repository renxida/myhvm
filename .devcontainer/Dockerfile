# Start from the base image
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Install necessary packages
RUN sudo apt-get update && sudo apt-get install -y curl build-essential libssl-dev pkg-config

# Install Rust and set to use the nightly version
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    $HOME/.cargo/bin/rustup default nightly

# Install hvm
RUN $HOME/.cargo/bin/cargo install hvm

# Add Rust environment variables to bashrc
RUN echo '. "$HOME/.cargo/env"' >> ~/.bashrc