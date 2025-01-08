# My Work Environment Bootstrapper

Bootstrap a macOS work environment from scratch

- zsh
- tmux
- vim (neovim)
- git
- alacritty

# Pre-requisites

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

Install neovim providers <https://neovim.io/doc/user/provider.html>

```
/usr/bin/python3 -m pip install --user --upgrade pynvim
npm install -g neovim
```

Start `nvim`, install neovim plugins with `:PlugInstall`

## Productivity Tools

- HomeBrew <https://brew.sh/>
- Alacritty <https://github.com/alacritty/alacritty>
- Neovim <https://neovim.io/>
- Rectangle <https://rectangleapp.com/>
