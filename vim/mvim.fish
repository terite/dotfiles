set -l mvim_vim "/Applications/MacVim.app/Contents/MacOS/Vim"
if test -e $mvim_vim;
    alias vim $mvim_vim;
    alias vi $mvim_vim;
end
