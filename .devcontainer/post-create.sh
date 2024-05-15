#!/usr/bin/env bash

mkdir -p /workspaces
cd /workspaces
git clone https://github.com/HigherOrderCO/bend.git
cd bend
cargo install --path . --locked