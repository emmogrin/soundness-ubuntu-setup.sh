#!/bin/bash

# Script for Soundness Setup in Ubuntu inside Termux
# Created by @admirkhen | Twitter: https://twitter.com/admirkhen
# This script will set up Rust, Soundness CLI, and generate a key pair after logging into Ubuntu via proot-distro.

# Echoing information to the user
echo "Running Ubuntu Setup... Please log into Ubuntu using 'proot-distro login ubuntu' before proceeding."

# Step 1: Install Rust in the Ubuntu environment
echo "Step 1: Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash

# Step 2: Configure the shell to use Rust
echo "Step 2: Configuring shell for Rust..."
source $HOME/.bashrc

# Step 3: Install soundnessup using the curl command
echo "Step 3: Installing soundnessup..."
curl -sSL https://raw.githubusercontent.com/soundnesslabs/soundness-layer/main/soundnessup/install | bash

# Step 4: Source bashrc again to apply soundnessup
source $HOME/.bashrc

# Step 5: Install Soundness CLI tool
echo "Step 5: Installing soundness CLI..."
soundnessup install

# Step 6: Generate a new key pair
echo "Step 6: Generating a new key pair..."
soundness-cli generate-key --name my-key

echo "🎉 Setup completed successfully! Your key pair has been generated."
echo "Remember to save your generated seed phrase and public key safely!"

# Final note with @admirkhen branding
echo "Script by @admirkhen - Follow me on Twitter for updates: https://twitter.com/admirkhen"
