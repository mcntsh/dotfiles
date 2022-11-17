#!/usr/bin/env python
# -*- coding: utf-8 -*- 

import sys

def wait_for_enter():
    input("[↵ Enter] to continue: ")

class BrewUpdateStep(object):
    def run(self, context):
        print("Update homebrew:")
        print("   brew update")
        wait_for_enter()

class OhMyZSHInstallStep(object):
    install_command = """
       sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    """
    def run(self, context):
        print("Install oh-my-zsh:")
        print("   {0}".format(self.install_command))
        wait_for_enter()
class OhMyZSHConfigureStep(object):
    def run(self, context):
        print("Move configuration files for Oh My ZSH:")
        print("   Move the file in `zsh/.zshrc` to the root of your computer")
        print("   Move the contents of the directory `zsh/.oh-my-zsh/custom` to `~/.oh-my-zsh/custom`")
        wait_for_enter()
class OhMyZSHSyntaxStep(object):
    install_command = """
       git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    """
    def run(self, context):
        print("Install the syntax highlighting plugin:")
        print("   {0}".format(self.install_command))
        wait_for_enter()
class OhMyZSHZStep(object):
    install_command = """
       git clone https://github.com/rupa/z.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z
    """
    def run(self, context):
        print("Install the z plugin:")
        print("   {0}".format(self.install_command))
        wait_for_enter()

class ItermDownloadStep(object):
    iterm_url = "https://www.iterm2.com"
    def run(self, context):
        print("Download & install iTerm2:")
        print("   {0}".format(self.iterm_url))
        wait_for_enter()
class HaskligDownloadStep(object):
    font_url = "https://nerdfonts.com/font-downloads"
    def run(self, context):
        print("Download & install Hasklug font:")
        print("   {0}".format(self.font_url))
        wait_for_enter()
class ITermColorsStep(object):
    iterm_colors = "https://github.com/arcticicestudio/nord-iterm2/blob/develop/src/xml/Nord.itermcolors"
    def run(self, context):
        print("Download & install iTerm2 colors:")
        print("   {0}".format(self.iterm_colors))
        wait_for_enter()
class ITermProfileStep(object):
    def run(self, context):
        print("Set up iTerm profile:")
        print("   Open iTerm")
        print("   Go to iTerm2 > Preferences")
        print("   Navigate to Profiles")
        print("   In the Colors tab, set the preset")
        print("   In the Text tab, set the nerd font; medium 15pt")
        wait_for_enter()

class KeyRepeatRateStep(object):
    def run(self, context):
        print("Set key repeat rate:")
        print("   Open System Preferences")
        print("   Go to Keyboard > Keyboard (tab)")
        print("   Set the Key Repeat to the fastest setting")
        print("   Set the Delay Until Repeat to the shortest setting")
        wait_for_enter()

class TigInstallStep(object):
    def run(self, context):
        print("Install Tig:")
        print("   brew install tig")
        wait_for_enter()
class TigSetupStep(object):
    def run(self, context):
        print("Configure Tig:")
        print("   Copy `tig/.tigrc` to the root of your computer")
        wait_for_enter()

class TmuxInstallStep(object):
    def run(self, context):
        print("Install Tmux:")
        print("   brew install tmux")
        wait_for_enter()
class TmuxSetupStep(object):
    def run(self, context):
        print("Configure Tmux:")
        print("   Copy `tmux/.tmux.conf` to the root of your computer")
        wait_for_enter()

class VimInstallStep(object):
    def run(self, context):
        print("Install neovim:")
        print("   brew install nvim")
        wait_for_enter()
class VimPythonStep(object):
    def run(self, context):
        print("Install Python for neovim:")
        print("   pip2 install --user neovim")
        print("   pip3 install --user neovim")
        wait_for_enter()
class VimPlugStep(object):
    vim_plug_command = """
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    """
    def run(self, context):
        print("Install vim-plug:")
        print("   {0}".format(self.vim_plug_command))
        wait_for_enter()
class VimConfigStep(object):
    def run(self, context):
        print("Add the config for Vim:")
        print("   Copy the file from `vim/.vimrc` to `~/.vimrc`")
        print("   Copy the files from `vim/.config/nvim` to `~/.config/nvim`")
        wait_for_enter()
class VimPluginsStep(object):
    def run(self, context):
        print("Install the plugins for vim:")
        print("   Open vim")
        print("   Run `:PlugInstall`")
        print("   Run `:CocInstall coc-tsserver coc-json coc-git coc-explorer coc-snippets coc-prettier coc-git`")
        wait_for_enter()

class RipGrepInstallStep(object):
    def run(self, context):
        print("Install RipGrep:")
        print("   brew install ripgrep")
        wait_for_enter()

class NvmInstallStep(object):
    nvm_install_command = "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash"
    def run(self, context):
        print("Install nvm:")
        print("   {0}".format(self.nvm_install_command))
        print("   run `nvm install 12.12`")
        print("   run `nvm use 12.12`")
        wait_for_enter()

class RangerInstallStep(object):
    def run(self, context):
        print("Install Ranger:")
        print("   brew install ranger")
        wait_for_enter()

class TpmInstallStep(object):
    def run(self, context):
        print("Install TPM:")
        print("   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm")
        wait_for_enter()
class TpmConfigureStep(object):
    def run(self, context):
        print("Configure TPM:")
        print("   start tmux `$ tmux`")
        print("   C-a I")
        wait_for_enter()


if __name__ == "__main__":
    context = {}
    procedure = [
        BrewUpdateStep(),
        NvmInstallStep(),
        RipGrepInstallStep(),
        OhMyZSHInstallStep(),
        OhMyZSHConfigureStep(),
        OhMyZSHSyntaxStep(),
        OhMyZSHZStep(),
        ItermDownloadStep(),
        HaskligDownloadStep(),
        ITermColorsStep(),
        ITermProfileStep(),
        KeyRepeatRateStep(),
        TigInstallStep(),
        TigSetupStep(),
        RipGrepInstallStep(),
        TmuxInstallStep(),
        TmuxSetupStep(),
        VimInstallStep(),
        VimPythonStep(),
        VimPlugStep(),
        VimConfigStep(),
        VimPluginsStep(),
        RangerInstallStep(),
        TpmInstallStep(),
        TpmConfigureStep()
    ]
    for step in procedure:
        step.run(context)
    print("✓ Done")
