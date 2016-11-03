set PATH "$DOTFILES/bin" $PATH

# macports
if test -d "/opt/local/bin"
  set PATH $PATH "/opt/local/bin"
end

if test -d "$HOME/bin"
    set PATH $PATH "$HOME/bin"
end

if test -d "$HOME/local/bin"
    set PATH $PATH "$HOME/local/bin"
end

if test -d "/Applications/Postgres.app/Contents/Versions/latest/bin"
    set PATH $PATH "/Applications/Postgres.app/Contents/Versions/latest/bin"
end

# Macports python pip 
if test -d "/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin"
    set PATH $PATH "/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin"
end

# System python pip
# if test -d "$HOME/Library/Python/2.7/bin"
#     set PATH $PATH "$HOME/Library/Python/2.7/bin"
# end

