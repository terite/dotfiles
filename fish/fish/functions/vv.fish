function vv
  cd "$HOME/vivaa/$argv"
end

complete --command vv \
    --authoritative \
    --no-files \
    --arguments '(cd $HOME/vivaa; __fish_complete_directories)'
