set PATH "$DOTFILES/bin" $PATH

if test -d "$HOME/bin"
    set PATH "$HOME/bin" $PATH
end

if test -d "$HOME/local/bin"
    set PATH "$HOME/local/bin" $PATH
end

if test -d "/Applications/Postgres.app/Contents/Versions/9.3/bin"
    set PATH "/Applications/Postgres.app/Contents/Versions/9.3/bin" $PATH
end

if test -d "/opt/local/bin"
  set PATH "/opt/local/bin" $PATH
end
