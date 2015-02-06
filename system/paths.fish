set PATH "$DOTFILES/bin" $PATH

if test -d "$HOME/bin"
    set PATH $PATH "$HOME/bin"
end

if test -d "$HOME/local/bin"
    set PATH $PATH "$HOME/local/bin"
end

if test -d "/Applications/Postgres.app/Contents/Versions/9.4/bin"
    set PATH $PATH "/Applications/Postgres.app/Contents/Versions/9.4/bin"
end

# Pip
if test -d "$HOME/Library/Python/2.7/bin"
    set PATH $PATH "$HOME/Library/Python/2.7/bin"
end

# macports
if test -d "/opt/local/bin"
  set PATH $PATH "/opt/local/bin"
end
