set DOTFILES (abspath (dirname (status -f))"/../..")

for file in $DOTFILES/*/*.fish;
    source $file;
end

set -g VIRTUALFISH_COMPAT_ALIASES
source $DOTFILES/fish/virtualfish/virtual.fish
source $DOTFILES/fish/virtualfish/auto_activation.fish
source $DOTFILES/fish/virtualfish/global_requirements.fish
