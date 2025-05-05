cat << 'EOF' > ~/.soundness-setup.sh
#!/bin/bash
echo "=========================================="
echo "  NOW ENTERING UBUNTU ENVIRONMENT         "
echo "       SAINT KHEN — @ADMIRKHEN            "
echo "=========================================="

apt update && apt upgrade -y

# Install dependencies
apt install -y build-essential protobuf-compiler curl wget pkg-config \
libcrypto++-dev libc6-dev openssl libssl-dev

# Install Soundness CLI
curl -sSL raw.githubusercontent.com/soundnesslabs/soundness-layer/main/soundnessup/install | bash

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Finalize installation
soundnessup install
soundnessup update

# Generate Soundness Key
soundness-cli generate-key --name my-key
soundness-cli export-key --name my-key

echo ""
echo "=========================================="
echo "   SETUP COMPLETE BY SAINT KHEN           "
echo "  PUBLIC KEY + SEED ABOVE — SAVE IT NOW!  "
echo "    TWITTER: https://x.com/ADMIRKHEN      "
echo "=========================================="
EOF

chmod +x ~/.soundness-setup.sh
bash ~/.soundness-setup.sh
