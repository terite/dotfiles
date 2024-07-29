set DOTFILES ""
begin;
    # path to this file
    set --local configpath (dirname (realpath (status --current-filename)))

    # up 2 directories to get to the root
    set --local dotfilespath "$configpath/../../"
    set DOTFILES (abspath $dotfilespath)
end;

# a helper to add a path once, if it exists
function _add_path
    set --local trypath $argv[1]

    if set --local index (contains --index -- $trypath $PATH)
        set --erase "PATH[$index]"
    end

    if test -d $trypath
        set --global --export --prepend PATH $trypath
    end
end

# set the correct $SHELL if kitty/osx/whoever didn't set it
if not string match --quiet --regex '/fish$' "$SHELL"
    set --export SHELL (which fish)
end

# homebrew is responsible for setting its own path
if test -f /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

# Source paths early to allow other configs to depend on them
source "$DOTFILES/paths.fish"

for file in $DOTFILES/*/*.fish;
    source $file;
end

# pnpm
set -gx PNPM_HOME "/Users/terite/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end