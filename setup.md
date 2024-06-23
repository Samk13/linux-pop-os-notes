# Setup

Short notes on installing various packages and tools

## Brew

follow instructions here: https://brew.sh/

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> All following command should use brew, I added this afterwards!

## fzf

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

## Fonts

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

## Neovim

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
```

After this step add this to ~/.bashrc:

```bash
# NeoVim
export PATH="$PATH:/opt/nvim-linux64/bin"
alias nvim='/opt/nvim-linux64/bin/nvim'
alias vi='/opt/nvim-linux64/bin/nvim'
```

Save the file and exit the editor (Ctrl+X in nano, then Y and Enter to confirm).

Reload your shell configuration file to apply the changes:

```bash
source ~/.bashrc
```

## add Neovim plugin

https://nvchad.com/docs/quickstart/install

git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

## Postman

If you encounter Postman craches when open after login run this command:

```bash
 cd ~/.var/app/com.getpostman.Postman/config/Postman/proxy
openssl req -subj '/C=US/CN=Postman Proxy' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout postman-proxy-ca.key -out postman-proxy-ca.crt

```

see: https://github.com/postmanlabs/postman-app-support/issues/12421#issuecomment-1859309220

## bash

Install https://starship.rs/
Install https://starship.rs/presets/#gruvbox-rainbow

edit python by adding `pyenv_version_name = true`
in ~/.config/starship.toml

```toml
[python]
symbol = ""
pyenv_version_name = true
python_binary = 'python3'
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'
```

## dust

see: [dust](https://github.com/bootandy/dust)
