set DOTFILES ""
begin;
    # path to this file
    set -l configpath (dirname (realpath (status --current-filename)))

    # up 2 directories to get to the root
    set -l dotfilespath "$configpath/../../"
    set DOTFILES (abspath $dotfilespath)
end;

for file in $DOTFILES/*/*.fish;
    source $file;
end

# I really don't need that greeting every time
set fish_greeting

