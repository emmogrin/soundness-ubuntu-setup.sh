#!/bin/bash

# Script for Soundness Setup in Ubuntu inside Termux
# Created by @admirkhen | Twitter: https://twitter.com/admirkhen

echo "Running Ubuntu Setup... Please log into Ubuntu using 'proot-distro login ubuntu' before proceeding."

# Step 1: Install Rust in the Ubuntu environment
echo "Step 1: Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash

# Step 2: Install build-essential (includes the 'cc' linker)
echo "Step 2: Installing build-essential..."
sudo apt update
sudo apt install -y build-essential

# Step 3: Configure shell for Rust
echo "Step 3: Configuring shell for Rust..."
export PATH="$HOME/.cargo/bin:$PATH"   # <- makes Rust tools available now

# Step 4: Install soundnessup
echo "Step 4: Installing soundnessup..."
curl -sSL https://raw.githubusercontent.com/soundnesslabs/soundness-layer/main/soundnessup/install | bash

# Step 5: Apply path change for soundnessup immediately
export PATH="$HOME/.cargo/bin:$PATH"   # <- ensures soundnessup works now

# Step 6: Install Soundness CLI
echo "Step 6: Installing soundness CLI..."
soundnessup install

# Step 7: Generate a new key pair
echo "Step 7: Generating a new key pair..."
soundness-cli generate-key --name my-key

echo "🎉 Setup completed successfully! Your key pair has been generated."
echo "Remember to save your generated seed phrase and public key safely!"

# Final note with @admirkhen branding
echo "Script by @admirkhen - Follow me on Twitter for updates: https://twitter.com/admirkhen"
