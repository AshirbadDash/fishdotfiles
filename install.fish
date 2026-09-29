#!/usr/bin/env fish

if not command -q apt
    echo "This installer supports Debian/Ubuntu/Mint systems only."
    exit 1
end

echo "==> Updating package lists..."
sudo apt update

echo "==> Installing packages..."
sudo apt install -y (string split "\n" < packages.txt)

echo "==> Installing Fisher..."
if not command -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    fisher install jorgebucaran/fisher
end

echo "==> Installing Fish plugins..."
fisher install

echo "==> Installing Fish configuration..."
mkdir -p ~/.config
cp -a fish/. ~/.config/fish/

echo "==> Done! Restart Fish or open a new terminal."
