# vim

1.  Install [nvim](https://neovim.io/) via homebrew: `brew update; brew install nvim`

2.  Install Python for neovim `pip2 install --user neovim; pip3 install --user neovim`

3. Install [vim plug](https://github.com/junegunn/vim-plug): `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`

4. Install [ripgrep](https://github.com/BurntSushi/ripgrep#installation) via homebrew: `brew install ripgrep`

5. Install node >12.12: `nvm install 12.12; nvm use 12.12`

6. Open vim and run `:PlugInstall`

7. Install the Coc plugins: `:CocInstall coc-tsserver coc-json coc-git coc-explorer coc-snippets coc-prettier coc-git`

8. Adjust your key repeat rate in your OS X settings `Settings > Keyboard > Keyboard Tab > Key Repeat`
