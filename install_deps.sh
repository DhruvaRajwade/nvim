#!/usr/bin/env bash
set -e

ENV_NAME="neovim_env"

# Create env with Python 3.10
mamba create -y -n $ENV_NAME python=3.10

# Activate env
eval "$(conda shell.bash hook)"
conda activate $ENV_NAME

# Install Neovim + tooling (force a full NodeJS build with npm bundled)
mamba install -y -c conda-forge \
  neovim \
  "nodejs>=20,<21" \
  ripgrep \
  lynx \
  gh \
  fd-find \
  lazygit \
  pynvim

# Symlink fd to fdfind
# FD_PATH=$(which fdfind || true)
# if [ -n "$FD_PATH" ]; then
#     ln -sf "$FD_PATH" "$(dirname $FD_PATH)/fd"
# fi

# Verify installs
echo "=== Installed versions in $ENV_NAME ==="
nvim --version | head -n 1
python -c "import neovim; print('pynvim:', neovim.__version__)"
node --version
npm --version
rg --version
fd --version
gh --version
lazygit --version
lynx --version

echo "✅ Setup complete! Run: conda activate $ENV_NAME"
