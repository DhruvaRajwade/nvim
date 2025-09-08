This is an effort to make installing neovim and getting the accompanying config up and running. I assume that the user won't have sudo access (or prefers not to install stuff globally). I usually avoid conda like the plague but in this case, conda (or rather mamba) is a godsend, making the install of general useful stuff pretty convenient.

1. CLONE CONFIG
2. DOWNLOAD nvim appimage from [official](https://github.com/neovim/neovim/releases)
3. If the appimage does not work, download the tarball `nvim-linux-x86_64.tar.gz`,
   run `tar xzvf nvim-linux-x86_64.tar.gz` and run `./nvim-linux-x86_64/bin/nvim` to open nvim
4. Don't forget to `chmod+x nvim_appimage`
5. ADD ALIAS TO .zshrc as: `alias nvim="$HOME/.config/nvim/nvim-linux-x86_64.appimage"`
   MAKE SURE: INSTALL THE CONDA ENV FIRST USING `install_deps.sh` and then and only then open neovim for the first time
6. Random: Do `:Copilot auth` for copilot sign in
7. Can add an alias that automatically activates the mamba/conda env whenever you open nvim like:

```bash
unalias nvim 2>/dev/null
nvim() {
    # Initialize conda in this shell
    eval "$(conda shell.zsh hook)"
    conda activate neovim_env >/dev/null 2>&1

    # Launch Neovim AppImage binary with all args
    "$HOME/.config/nvim/nvim-linux-x86_64/bin/nvim" "$@"

```

#### Setting up/configuring Tmux

- Create a `.tmux.conf` file and `.tmux` directory
- For Catppuccin, follow this:

```bash
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

```

#NOTE: Catppuccin works only if `tmux.3.2`, if the global tmux is not up to mark, you can do a conda install (hehe)

- Inside tmux, hit `<prefix>I` to install all plugins and reload the config, and this should be it!

#### Installing UV

`curl -LsSf https://astral.sh/uv/install.sh | sh` should do the trick

#### Setting up starship

`curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir ~/.local/bin --yes`: For an User specific install

`eval "$(starship init zsh)"` should be added in your `.zshrc`

the `starship.toml` file works out of the box, it should be placed inside `~/.config/starship/`
#NOTE: A NerdFont must be installed for starship to work

#### Setting up zsh

#TODO: Add logic to install zsh

- To make zsh default (if available system-wide), `chsh -s zsh`
  #NOTE: Install fzf using:
  ```bash
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  ```

To setup oh-my-zsh:

1. `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
2. Regarding plugins: User plugins go into `~/.oh-my-zsh/custom/plugins`
3. For all my plugins, follow the below script to install all the custom ones:

```bash
#!/usr/bin/env bash
set -euo pipefail

# Set custom plugins directory
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
PLUGIN_DIR="$ZSH_CUSTOM/plugins"

# Ensure the directory exists
mkdir -p "$PLUGIN_DIR"

# Repositories to clone
repos=(
  "https://github.com/zdharma-continuum/fast-syntax-highlighting.git"
  "https://github.com/zsh-users/zsh-autosuggestions.git"
  "https://github.com/zsh-users/zsh-history-substring-search.git"
  "https://github.com/qoomon/zsh-lazyload.git"
)

# Clone each repo into the plugins dir
for repo in "${repos[@]}"; do
  name=$(basename "$repo" .git)
  dest="$PLUGIN_DIR/$name"

  if [ -d "$dest" ]; then
    echo "Skipping $name (already exists)"
  else
    echo "Cloning $name into $PLUGIN_DIR"
    git clone "$repo" "$dest"
  fi
done

echo "All plugins installed in $PLUGIN_DIR"
```
