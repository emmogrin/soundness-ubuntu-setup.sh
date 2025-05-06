#!/bin/bash

# Script for Soundness Setup in Ubuntu inside Termux
# Created by @admirkhen | Twitter: https://twitter.com/admirkhen

echo "Running Ubuntu Setup... Please log into Ubuntu using 'proot-distro login ubuntu' before proceeding."

# Step 1: Install Rust in the Ubuntu environment
echo "Step 1: Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y

# Step 2: Configure shell for Rust
echo "Step 2: Configuring shell for Rust..."
export PATH="$HOME/.cargo/bin:$PATH"

# Step 3: Install soundnessup
echo "Step 3: Installing soundnessup..."
curl -sSL https://raw.githubusercontent.com/soundnesslabs/soundness-layer/main/soundnessup/install | bash

# Step 4: Apply path changes immediately
export PATH="$HOME/.cargo/bin:$PATH"

# Step 5: Install Soundness CLI
echo "Step 5: Installing soundness CLI..."
bash -i -c "soundnessup install"

# Step 6: Generate a new key pair
echo "Step 6: Generating a new key pair..."
bash -i -c "soundness-cli generate-key --name my-key"

echo "🎉 Setup completed successfully! Your key pair has been generated."
echo "Remember to save your generated seed phrase and public key safely!"

# Final note with @admirkhen branding
echo "Script by @admirkhen - Follow me on Twitter for updates: https://twitter.com/admirkhen"
