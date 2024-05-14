#!/usr/bin/env bash

mkdir -p /workspaces
cd /workspaces
git clone -b hvm-core https://github.com/HigherOrderCO/bend.git && cd bend && cargo install --path . --locked
# add alias bend=hvml
echo "alias bend=hvml" >> ~/.bashrc