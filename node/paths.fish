set NODE8_BIN "/usr/local/opt/node@8/bin"
if test -d "$NODE8_BIN"
    set PATH "$NODE8_BIN" $PATH
end

if test -d "$HOME/.npm-packages/bin"
    set PATH "$HOME/.npm-packages/bin" $PATH
end
