set DOTFILES ""
begin;
    # path to this file
    set -l configpath (dirname (realpath (status --current-filename)))

    # up 2 directories to get to the root
    set -l dotfilespath "$configpath/../../"
    set DOTFILES (abspath $dotfilespath)
end;

# a helper to add a path once, if it exists
function _add_path
    set -l trypath $argv[1]

    if set -l index (contains --index -- $trypath $PATH)
        set -e "PATH[$index]"
    end

    if test -d $trypath
        set --global --export --prepend PATH $trypath
    end

end

function _has_command
  which $argv[1] > /dev/null
end

for file in $DOTFILES/*/*.fish;
    source $file;
end

# I really don't need that greeting every time
set fish_greeting

# set -x CC /usr/bin/clang-10
# set -x CXX /usr/bin/clang++-10
