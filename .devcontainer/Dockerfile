# Start from the base image
FROM ghcr.io/rust-lang/rust:nightly-bullseye-slim

# Install hvm
RUN cargo install hvm

# Install bend
RUN cd /workspaces && \
    git clone https://github.com/HigherOrderCO/bend.git && \
    cd bend && \
    cargo install --path . --locked
