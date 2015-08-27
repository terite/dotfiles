
if which xsel 1>/dev/null;
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
end
