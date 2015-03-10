set -l mvim_vim "/Applications/MacVim.app/Contents/MacOS/Vim"

# prefer neovom > macvim > vim
if which nvim 1>/dev/null;
    alias vim nvim;
    alias vi nvim;
else if test -e $mvim_vim;
    alias vim $mvim_vim;
    alias vi $mvim_vim;
end
