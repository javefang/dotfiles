# My Work Environment Bootstrapper

Bootstrap a macOS work environment from scratch

- zsh
- tmux
- vim
- git
- alacritty

## Install homebrew

Install homebrew (Refer to <https://brew.sh/>)

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Restore brew packages

```
brew bundle
```

## Install font

Download `Menlo for Powerline.ttf` and double-click to install.

<https://github.com/lxbrtsch/Menlo-for-Powerline/blob/master/Menlo%20for%20Powerline.ttf>

## Install oh-my-zsh

Refer to <https://ohmyz.sh/> for details

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install dotfiles

```
./install.sh
```

## Install tmux plugins

Install `tpm` <https://github.com/tmux-plugins/tpm>

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start tmux and install tmux plugins with `prefix + I`


## Configure neovim

Install vimplug <https://github.com/junegunn/vim-plug>

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Use brew-installed python3

```
ln -s /opt/homebrew/bin/python3 /opt/homebrew/bin/python3.13
ln -s /opt/homebrew/bin/pip3 /opt/homebrew/bin/pip3.13
```

Install neovim providers <https://neovim.io/doc/user/provider.html>

```
pip3 install --user --upgrade pynvim
npm install -g neovim
```

Start `nvim`, install neovim plugins with `:PlugInstall`

## Development environment configuration

### Go

Install go

```
brew install go
```

Install `gopls`

```
go install golang.org/x/tools/cmd/gopls@latest
```

Install nvim coc plugins

```
:CocInstall coc-go
```

### Rust

Install rust ([link]<https://doc.rust-lang.org/book/ch01-01-installation.html>)

```
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
xcode-select --install
```

Install `rust-analyzer` ([link]<https://rust-analyzer.github.io/book/rust_analyzer_binary.html>)

```
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-aarch64-apple-darwin.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x .local/bin/rust-analyzer
```

Install nvim coc plugins

```
:CocInstall coc-rust
```

## Productivity Tools

- HomeBrew <https://brew.sh/>
- Alacritty <https://github.com/alacritty/alacritty>
- Neovim <https://neovim.io/>
- Rectangle <https://rectangleapp.com/>
