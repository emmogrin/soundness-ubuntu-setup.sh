#!/bin/bash

echo "=========================================="
echo "  NOW ENTERING UBUNTU ENVIRONMENT"
echo "       SAINT KHEN — @ADMIRKHEN"
echo "=========================================="

# Update & upgrade
apt update && apt upgrade -y

# Essential tools
apt install -y curl wget git build-essential pkg-config libssl-dev protobuf-compiler

# Install Rust (skip if already installed)
if ! command -v cargo &> /dev/null; then
  curl https://sh.rustup.rs -sSf | sh -s -- -y
  source $HOME/.cargo/env
fi

# Clone the repo
cd ~
rm -rf soundness_cli
git clone https://github.com/OxcloneNetwork/soundness_cli.git
cd soundness_cli

# Build binaries
cargo build --release

# Add binaries to PATH
mkdir -p $HOME/.cargo/bin
cp target/release/soundness-cli $HOME/.cargo/bin/
cp target/release/soundnessup $HOME/.cargo/bin/

# Source env and test
source $HOME/.cargo/env
echo
echo "✅ Binaries installed successfully!"
echo

soundness-cli --help || echo "⚠️ soundness-cli not found"
soundnessup --help || echo "⚠️ soundnessup not found"

echo "=========================================="
echo "✅ DONE — Script by SAINT KHEN (@ADMIRKHEN)"
echo "Follow me: https://twitter.com/admirkhen"
echo "GitHub:    https://github.com/emmogrin"
echo "=========================================="
