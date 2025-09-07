### 4 Sept 2025: Tried integrating snacks.nvim

- For remote systems disable the scrolling for snacks, and get the neoscroll.lua file out of the archive
- For remote systems, do the same for the indent-blankline plugin, and disable indent and scroll from snacks
- For remote: Don't need vimtex, markdown and img-clip stuff

1. CLONE CONFIG
2. DOWNLOAD nvim appimage from [official](https://github.com/neovim/neovim/releases)
3. If the appimage does not work, download the tarball `nvim-linux-x86_64.tar.gz`, run `tar xzvf nvim-linux-x86_64.tar.gz` and run `./nvim-linux-x86_64/bin/nvim` to open nvim
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
