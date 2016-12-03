function _add_path
    set trypath $argv[1]
    for p in $PATH
        if [ $p = $trypath ]
            # already in $PATH
            return 0
        end
    end

    if test -d $trypath
        set PATH $PATH $trypath
    end

end

_add_path "$DOTFILES/bin"
_add_path "$HOME/bin"
_add_path "$HOME/local/bin"
_add_path "/Applications/Postgres.app/Contents/Versions/latest/bin"

# system python & pip
# _add_path "$HOME/Library/Python/2.7/bin"

# macports python & pip
_add_path "/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin"

# macports
_add_path "/opt/local/bin"
