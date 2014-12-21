# Avoid an infinite loop
if set -q DOTFILES;
    exit;
end

set DOTFILES (abspath (dirname (status -f))"/../../..")
for i in $DOTFILES/**/*.fish;
    source $i;
end

# TODO: These should be caught by the above loop. They're not for some reason
set -g VIRTUALFISH_COMPAT_ALIASES
source $DOTFILES/fish/virtualfish/virtual.fish
source $DOTFILES/fish/virtualfish/auto_activation.fish
source $DOTFILES/fish/virtualfish/global_requirements.fish

set fish_greeting ""
