#!/bin/bash

echo "=========================================="
echo "  NOW ENTERING UBUNTU ENVIRONMENT"
echo "       SAINT KHEN — @ADMIRKHEN"
echo "=========================================="

# Update and upgrade Ubuntu
apt update && apt upgrade -y

# Install required dependencies
apt install -y build-essential protobuf-compiler curl wget pkg-config libcrypto++-dev libc6-dev openssl libssl-dev

# Install soundnessup
echo "🚀 Installing soundnessup..."
curl -sSL https://raw.githubusercontent.com/soundnesslabs/soundness-layer/main/soundnessup/install | bash

# Install Rust
echo "🦀 Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Source Rust and bash environment
source "$HOME/.bashrc"
source "$HOME/.cargo/env"

# Update & install soundnessup toolchain
soundnessup install
soundnessup update

# Generate keypair with your tag
soundness-cli generate-key --name my-key
soundness-cli export-key --name my-key

echo "=========================================="
echo "✅ DONE — Script by SAINT KHEN (@ADMIRKHEN)"
echo "Follow me on Twitter: https://twitter.com/admirkhen"
echo "GitHub: https://github.com/emmogrin"
echo "=========================================="
