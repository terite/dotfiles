set -l mvim_vim "/Applications/MacVim.app/Contents/MacOS/Vim"
set -l vim_cmd "vim"

# prefer neovom > macvim > vim
if which nvim 1>/dev/null;
    set -l vim_cmd nvim
else if test -e $mvim_vim;
    set -l vim_cmd $mvim_vim
end

alias vim "$vim_cmd -w ~/vimout.txt"
alias vi "$vim_cmd -w ~/vimout.txt"
