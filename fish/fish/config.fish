set DOTFILES (abspath (dirname (status -f))"/../..")

# I really don't need that greeting every time
set --erase fish_greeting

for file in $DOTFILES/*/*.fish;
    . $file;
end

set -g VIRTUALFISH_COMPAT_ALIASES
. $DOTFILES/fish/virtualfish/virtual.fish
. $DOTFILES/fish/virtualfish/auto_activation.fish
. $DOTFILES/fish/virtualfish/global_requirements.fish

# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
alias imgcat=~/.iterm2/imgcat; alias it2dl=~/.iterm2/it2dl

. $DOTFILES/fish/fish/nvm-wrapper/nvm.fish
