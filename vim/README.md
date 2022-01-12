# VIM

1.  Install [Homebrew](https://brew.sh/)

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

2.  Install [nvim](https://neovim.io/) via homebrew: `brew update; brew install nvim`

3.  Install Python for neovim `pip2 install --user neovim; pip3 install --user neovim`

4. Install [vim plug](https://github.com/junegunn/vim-plug): `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
