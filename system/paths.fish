function _add_path
    set -l trypath $argv[1]

    if contains -- $trypath $fish_user_paths
        return 0
    end

    if test -d $trypath
        set --global --export --prepend fish_user_paths $trypath
    end

end

_add_path "$DOTFILES/bin"
_add_path "$HOME/local/bin"
