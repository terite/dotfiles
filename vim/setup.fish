if has_command nvim
  set --export EDITOR "nvim"
  alias vim nvim
else if has_command vim
  set --export EDITOR "vim"
end

