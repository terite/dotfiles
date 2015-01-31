set DOTFILES (abspath (dirname (status -f))"/../..")

for file in $DOTFILES/*/*.fish;
    . $file;
end

set -g VIRTUALFISH_COMPAT_ALIASES
. $DOTFILES/fish/virtualfish/virtual.fish
. $DOTFILES/fish/virtualfish/auto_activation.fish
. $DOTFILES/fish/virtualfish/global_requirements.fish
