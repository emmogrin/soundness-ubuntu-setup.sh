#!/bin/bash

# Step 1: Install Rust (if not installed)
if ! command -v rustc &> /dev/null; then
    echo "Rust is not installed. Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env"
fi

# Step 2: Install build-essential (gcc, make, etc.)
if ! command -v gcc &> /dev/null; then
    echo "Installing build-essential..."
    apt update && apt install -y build-essential
fi

# Step 3: Install sudo (if not installed)
if ! command -v sudo &> /dev/null; then
    echo "Installing sudo..."
    apt update && apt install -y sudo
fi

# Step 4: Proceed with soundnessup and soundness-cli installation
echo "Installing soundnessup..."
# Add any commands to install soundnessup
source "$HOME/.cargo/env"
soundnessup

echo "Installing soundness-cli..."
# Add commands to install soundness-cli
git clone https://github.com/soundness/soundness-cli.git
cd soundness-cli
cargo build --release

echo "Setup completed successfully!"

# Generate key pair
soundness-cli generate-keypair

echo "🎉 Setup completed. Your key pair has been generated!"
