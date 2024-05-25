# Setup

short notes on installing various packages and tools

# fzf
Install fzf from source
```bash
sudo apt install fzf
```
Add these lines to your `.bashrc` or `.zshrc` file to add keybindings and theme colors
```bash
# fzf
# ===
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash

# Drakola theme for fzf
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#131e29,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
```


# Fonts

Download the Nerd Font:
Go to the Nerd Fonts website and download your preferred Nerd Font (e.g., JetBrainsMono Nerd Font).

Install the Nerd Font:
Extract the downloaded zip file and install the font files. You can do this manually or using the terminal.

## Create a directory for the fonts if it doesn't exist
mkdir -p ~/.local/share/fonts

## Move the extracted font files to the fonts directory
mv path_to_downloaded_fonts/*.ttf ~/.local/share/fonts/

## Update the font cache
fc-cache -fv


# Neovim

install from here:
https://github.com/neovim/neovim/releases/tag/v0.10.0

sudo mv nvim-linux64 /usr/local/

Extract the tarball:

```bash
tar xzvf nvim-linux64.tar.gz
Move the extracted directory to /usr/local (you may need sudo for this):
```

```bash
sudo mv nvim-linux64 /usr/local/
```
Open your shell configuration file (e.g., .bashrc or .zshrc depending on your shell) in a text editor:

```bash
nano ~/.bashrc
# or if you are using zsh
nano ~/.zshrc
```
Add the following lines to create aliases for nvim and vi:

```bash
alias nvim='/usr/local/nvim-linux64/bin/nvim'
alias vi='/usr/local/nvim-linux64/bin/nvim'
```
Save the file and exit the editor (Ctrl+X in nano, then Y and Enter to confirm).

Reload your shell configuration file to apply the changes:

```bash
source ~/.bashrc
```

# add Neovim plugin

https://nvchad.com/docs/quickstart/install

git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

